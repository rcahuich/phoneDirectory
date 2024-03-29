package blog.omarello

class ContactController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [contactInstanceList: Contact.list(params), contactInstanceTotal: Contact.count()]
    }

    def create = {
        def contactInstance = new Contact()
        contactInstance.properties = params
        return [contactInstance: contactInstance]
    }

    def save = {
        def contactInstance = new Contact(params)
        
		def _toBeRemoved = contactInstance.phones.findAll {!it}

        // if there are phones to be removed
        if (_toBeRemoved) {
			contactInstance.phones.removeAll(_toBeRemoved)
         }
		
        //update my indexes
        contactInstance.phones.eachWithIndex(){phn, i ->
			if(phn)
				phn.index = i
        }
        
        if (contactInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'contact.label', default: 'Contact'), contactInstance.id])}"
            redirect(action: "show", id: contactInstance.id)
        }
        else {
            render(view: "create", model: [contactInstance: contactInstance])
        }
    }

    def show = {
        def contactInstance = Contact.get(params.id)
        if (!contactInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contact.label', default: 'Contact'), params.id])}"
            redirect(action: "list")
        }
        else {
            [contactInstance: contactInstance]
        }
    }

    def edit = {
        def contactInstance = Contact.get(params.id)
        if (!contactInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contact.label', default: 'Contact'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [contactInstance: contactInstance]
        }
    }
    
    def delete = {
        def contactInstance = Contact.get(params.id)
        if (contactInstance) {
            try {
                contactInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'contact.label', default: 'Contact'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'contact.label', default: 'Contact'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contact.label', default: 'Contact'), params.id])}"
            redirect(action: "list")
        }
    }

    def update = {
        def contactInstance = Contact.get(params.id)
        if (contactInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (contactInstance.version > version) {
                    
                    contactInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'contact.label', default: 'Contact')] as Object[], "Another user has updated this Contact while you were editing")
                    render(view: "edit", model: [contactInstance: contactInstance])
                    return
                }
            }
            contactInstance.properties = params
            
            // find the phones that are marked for deletion
            def _toBeDeleted = contactInstance.phones.findAll {it?.deleted || !it}

            // if there are phones to be deleted remove them all            
            if (_toBeDeleted) {
                contactInstance.phones.removeAll(_toBeDeleted)
            }
            
            //update my indexes
            contactInstance.phones.eachWithIndex(){phn, i ->
				if(phn)
					phn.index = i
            }
            
            if (!contactInstance.hasErrors() && contactInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'contact.label', default: 'Contact'), contactInstance.id])}"
                redirect(action: "show", id: contactInstance.id)
            }
            else {
                render(view: "edit", model: [contactInstance: contactInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contact.label', default: 'Contact'), params.id])}"
            redirect(action: "list")
        }
    }
}
