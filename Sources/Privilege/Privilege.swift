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
        var status: OSStatus = -1
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
        return status == 0
    }
    
    
    /// De-escalate **superuser** privileges.
    ///
    /// - Returns: `true` if successful, `false` otherwise.
    public static func deEscalate() -> Bool {
        guard let auth = authRef else { return false }
        return AuthorizationFree(auth, [.destroyRights]) == 0
    }
    
}
