import Foundation

/// Manage authorization privileges.
public final class Privilege {
    
    /// Authorization reference.
    private static var authRef: AuthorizationRef?
    
    /// Name of granted rights.
    private static let rightsName = "com.privilege.superuser"
    
    /// Request **superuser** privileges.
    ///
    /// - Returns: `true` if successful, `false` otherwise.
    public static func escalate() -> Bool {
        var status: OSStatus = errAuthorizationDenied
        rightsName.withCString({name in
            var authItem = AuthorizationItem(
                name: name,
                valueLength: 0,
                value: nil,
                flags: 0
            )
            withUnsafeMutablePointer(to: &authItem, {authItemPtr in
                var rights = AuthorizationRights(
                    count: 1,
                    items: authItemPtr
                )
                let flags: AuthorizationFlags = [.interactionAllowed, .extendRights]
                status = AuthorizationCreate(&rights, nil, flags, &authRef)
            })
        })
        return status == errAuthorizationSuccess
    }
    
    
    /// De-escalate **superuser** privileges.
    ///
    /// - Returns: `true` if successful, `false` otherwise.
    /// - Note: De-escalation will report `true` if de-escalation is executed
    ///         without non-privileged state.
    public static func deEscalate() -> Bool {
        guard let auth = authRef else { return true }
        let status = AuthorizationFree(auth, [.destroyRights]) == errAuthorizationSuccess
        authRef = nil
        return status
    }
    
}
