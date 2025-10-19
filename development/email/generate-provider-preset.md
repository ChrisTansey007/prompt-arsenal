---
id: prm.email-provider-preset
type: prompt
title: Email Provider Preset Generator
tags: [email, configuration, imap, smtp, providers]
role: user
summary: Generate complete email provider configuration presets with IMAP/SMTP settings, OAuth support, app password requirements, and user-friendly help text for 15+ email providers.
vars:
  - { name: provider_name, required: true, description: "Provider name (e.g., 'Yahoo Mail', 'iCloud', 'Gmail')" }
  - { name: requires_app_password, required: false, default: "auto-detect", description: "Does this provider require app-specific password?" }
  - { name: supports_oauth, required: false, default: "auto-detect", description: "Does this provider support OAuth 2.0?" }
  - { name: app_name, required: false, default: "Your App", description: "Name of the application for help text" }
merge:
  - mem.email-passkey-auth
  - rule.email-docs-standards
modelHints: { temperature: 0.2 }
version: 1
---

# Email Provider Preset Generator

Generate a complete email provider configuration preset for **{{provider_name}}** with IMAP/SMTP settings, security requirements, and user-friendly setup instructions.

---

## Required Output Format

```typescript
interface EmailProviderPreset {
  // Provider identity
  id: string;                    // Lowercase, hyphenated (e.g., "yahoo-mail")
  name: string;                  // Display name (e.g., "Yahoo Mail")
  
  // IMAP settings
  imap_host: string;            // IMAP server hostname
  imap_port: number;            // Usually 993 for SSL
  imap_use_ssl: boolean;        // true for SSL, false for TLS
  
  // SMTP settings
  smtp_host: string;            // SMTP server hostname
  smtp_port: number;            // Usually 587 for TLS, 465 for SSL
  smtp_use_tls: boolean;        // true for STARTTLS
  smtp_use_ssl?: boolean;       // true for SSL/TLS (port 465)
  
  // Authentication
  requires_app_password: boolean;
  supports_oauth: boolean;
  oauth_provider?: string;      // "google", "microsoft", "yahoo"
  
  // User guidance
  help_text: string;            // Detailed setup instructions
  security_url?: string;        // URL to security/app password page
  setup_guide_url?: string;     // Link to provider's setup guide
  
  // Additional info
  common_issues?: string[];     // List of common problems
  note?: string;                // Important additional context
}
```

---

## {{provider_name}} Configuration

**Research and provide:**

### 1. IMAP Settings
- Official IMAP hostname
- Port (993 for SSL, 143 for STARTTLS)
- SSL/TLS preference

### 2. SMTP Settings
- Official SMTP hostname  
- Port (587 for STARTTLS, 465 for SSL)
- Authentication method

### 3. Authentication Requirements
- Does it require app-specific password?
- Does it support OAuth 2.0?
- Does it use passkeys by default?

### 4. Help Text
If **requires_app_password = true**, include:
- Clear explanation of why app password needed
- Step-by-step instructions with numbered list
- Direct link to security settings
- Mention passkey usage if applicable
- Expected password format (usually 16 characters)

If **requires_app_password = false**, include:
- Any special setup needed
- Whether to enable "less secure apps" or similar
- Link to setup documentation

### 5. Common Issues
- Authentication failures
- Connection timeouts
- Security blocks
- Provider-specific gotchas

---

## Example Presets

### Example 1: Gmail (Google)

```typescript
{
  id: 'gmail',
  name: 'Gmail',
  
  imap_host: 'imap.gmail.com',
  imap_port: 993,
  imap_use_ssl: true,
  
  smtp_host: 'smtp.gmail.com',
  smtp_port: 587,
  smtp_use_tls: true,
  
  requires_app_password: true,
  supports_oauth: true,
  oauth_provider: 'google',
  
  help_text: `**Gmail requires an app-specific password.**

**Prerequisites:**
- Two-Factor Authentication (2FA) must be enabled on your Google account

**Setup Steps:**
1. Go to https://myaccount.google.com/apppasswords
2. Sign in to your Google account
3. Under "Select app", choose "Mail"
4. Under "Select device", choose "Other (Custom name)"
5. Enter "{{app_name}}" as the device name
6. Click "Generate"
7. Copy the 16-character password (format: xxxx xxxx xxxx xxxx)
8. Paste it in the password field above (spaces optional)

**Important:**
- You'll continue using your regular Google sign-in for Gmail's website
- The app password is only for this email app
- You can revoke this password anytime from your Google account settings

**Can't find App Passwords?**
- Ensure 2FA is enabled first
- If you use Google Workspace, check if your admin allows app passwords`,
  
  security_url: 'https://myaccount.google.com/apppasswords',
  setup_guide_url: 'https://support.google.com/accounts/answer/185833',
  
  common_issues: [
    'App Passwords option missing: Enable 2-Factor Authentication first',
    'Authentication failed: Remove spaces from app password when entering',
    'IMAP not working: Enable IMAP in Gmail settings (Settings → Forwarding and POP/IMAP → Enable IMAP)',
    'Google Workspace: Check with administrator if app passwords are allowed'
  ],
  
  note: 'Prefer OAuth when possible for better security. App passwords should be used when OAuth is not available.'
}
```

### Example 2: Yahoo Mail

```typescript
{
  id: 'yahoo-mail',
  name: 'Yahoo Mail',
  
  imap_host: 'imap.mail.yahoo.com',
  imap_port: 993,
  imap_use_ssl: true,
  
  smtp_host: 'smtp.mail.yahoo.com',
  smtp_port: 587,
  smtp_use_tls: true,
  
  requires_app_password: true,
  supports_oauth: true,
  oauth_provider: 'yahoo',
  
  help_text: `**Yahoo Mail requires an app-specific password.**

**If you sign in with passkeys or push notifications** (no password), you'll need to generate an app password for email apps.

**Setup Steps:**
1. Go to https://account.yahoo.com/security
2. Sign in with your passkey (fingerprint/face) or password
3. Scroll down to "Generate app password"
4. Click "Generate app password" or "Manage app passwords"
5. Select "Other App" from the dropdown
6. Enter "{{app_name}}" as the app name
7. Click "Generate"
8. Copy the 16-character password shown
9. Paste it in the password field above

**Understanding the Difference:**
- **Passkey/Push**: For signing in to Yahoo's website (more secure, no password)
- **App Password**: For email apps like this one (required by email protocols)

**You'll use:**
- Your passkey → Yahoo website
- App password → This email app

**Important:**
- App passwords may auto-expire after 6 months of inactivity
- You can create multiple app passwords (one per device/app)
- Revoke unused passwords from your Yahoo security settings`,
  
  security_url: 'https://account.yahoo.com/security',
  setup_guide_url: 'https://help.yahoo.com/kb/SLN15241.html',
  
  common_issues: [
    '"Generate app password" not visible: Sign out and back in with your passkey',
    'Getting push notification instead: That\'s for web login. You still need app password for email.',
    'Authentication failed after 6 months: App password expired, generate a new one',
    'Password not working: Ensure you\'re entering the app password, not your regular password'
  ],
  
  note: 'Yahoo heavily uses passkeys. Most users won\'t have a traditional password. Clear communication about app passwords is critical.'
}
```

### Example 3: iCloud Mail (Apple)

```typescript
{
  id: 'icloud-mail',
  name: 'iCloud Mail',
  
  imap_host: 'imap.mail.me.com',
  imap_port: 993,
  imap_use_ssl: true,
  
  smtp_host: 'smtp.mail.me.com',
  smtp_port: 587,
  smtp_use_tls: true,
  
  requires_app_password: true,
  supports_oauth: false,
  
  help_text: `**iCloud Mail requires an app-specific password.**

**Prerequisites:**
- Two-factor authentication (2FA) must be enabled for your Apple ID

**Setup Steps:**
1. Go to https://appleid.apple.com
2. Sign in with your Apple ID
3. Navigate to the "Security" section
4. Under "App-Specific Passwords", click "Generate an app-specific password..."
5. Enter a label: "{{app_name}}"
6. Click "Create"
7. Copy the generated password (shown only once - no second chance!)
8. Paste it in the password field above

**Important:**
- This is NOT your device unlock password (Face ID/Touch ID)
- This is NOT your Apple ID password
- This is a special password just for email apps
- Maximum 25 app-specific passwords per Apple ID
- Can't recover if lost - must generate a new one

**Can't generate app-specific password?**
- Enable Two-Factor Authentication first in Security settings`,
  
  security_url: 'https://appleid.apple.com',
  setup_guide_url: 'https://support.apple.com/en-us/HT204397',
  
  common_issues: [
    'Option not showing: Enable Two-Factor Authentication on Apple ID first',
    'Reached limit: Maximum 25 app passwords - revoke old ones you don\'t use',
    'Lost password: Cannot recover - revoke and generate a new one',
    'Authentication failed: Double-check you copied the entire password'
  ],
  
  note: 'Apple users are very familiar with Face ID/Touch ID. Clearly distinguish that this is a separate password for email protocols.'
}
```

### Example 4: Outlook.com / Microsoft 365

```typescript
{
  id: 'outlook-com',
  name: 'Outlook.com',
  
  imap_host: 'outlook.office365.com',
  imap_port: 993,
  imap_use_ssl: true,
  
  smtp_host: 'smtp.office365.com',
  smtp_port: 587,
  smtp_use_tls: true,
  
  requires_app_password: true,
  supports_oauth: true,
  oauth_provider: 'microsoft',
  
  help_text: `**Microsoft accounts require app-specific password or OAuth.**

**Prefer OAuth if available** (more secure). If OAuth isn't an option, use an app password:

**Setup Steps for App Password:**
1. Go to https://account.microsoft.com/security
2. Sign in to your Microsoft account
3. Click "Advanced security options"
4. Under "App passwords", click "Create a new app password"
5. Copy the generated password
6. Paste it in the password field above

**Or directly:**
1. Go to https://account.live.com/proofs/AppPassword
2. Click "Create a new app password"
3. Copy and use the password

**Prerequisites:**
- Two-step verification must be enabled

**For Microsoft 365 / Azure AD users:**
- App passwords may not be available (organization policy)
- Contact your IT administrator
- OAuth may be required instead`,
  
  security_url: 'https://account.microsoft.com/security/apppasswords',
  setup_guide_url: 'https://support.microsoft.com/en-us/account-billing/using-app-passwords-with-apps-that-don-t-support-two-step-verification-5896ed9b-4263-e681-128a-a6f2979a7944',
  
  common_issues: [
    'App passwords not available: Enable two-step verification first',
    'Azure AD / Work account: May not support app passwords - use OAuth instead',
    'Authentication failed: Ensure Modern Authentication is enabled in account settings',
    'IMAP not working: Check if IMAP is enabled in Outlook.com settings'
  ],
  
  note: 'Prefer OAuth over app passwords when possible. Microsoft is gradually phasing out app passwords in favor of OAuth.'
}
```

### Example 5: ProtonMail

```typescript
{
  id: 'protonmail',
  name: 'ProtonMail',
  
  imap_host: '127.0.0.1',        // Local Bridge connection
  imap_port: 1143,
  imap_use_ssl: true,
  
  smtp_host: '127.0.0.1',        // Local Bridge connection
  smtp_port: 1025,
  smtp_use_tls: true,
  
  requires_app_password: false,   // Bridge generates password
  supports_oauth: false,
  
  help_text: `**ProtonMail requires Bridge application (not web-based app password).**

**Important:** ProtonMail uses end-to-end encryption. To use IMAP/SMTP, you must install ProtonMail Bridge.

**Setup Steps:**
1. Download ProtonMail Bridge from https://protonmail.com/bridge/
2. Install and open the Bridge application
3. Click "Add account" in Bridge
4. Sign in to your ProtonMail account
5. Bridge will display your IMAP/SMTP credentials
6. Copy the username and password from Bridge
7. Enter them in the fields above

**Connection Settings:**
- IMAP: 127.0.0.1:1143 (local Bridge connection)
- SMTP: 127.0.0.1:1025 (local Bridge connection)
- Username: Your ProtonMail address
- Password: Generated by Bridge (NOT your ProtonMail password)

**Requirements:**
- ProtonMail Bridge must be running for email to work
- Bridge is included with paid plans (not available on free plan)
- Works on Windows, macOS, and Linux

**Troubleshooting:**
- If connection fails, ensure Bridge is running
- Check firewall allows Bridge connections
- Restart Bridge if credentials change`,
  
  security_url: 'https://account.proton.me/security',
  setup_guide_url: 'https://protonmail.com/support/knowledge-base/imap-smtp-and-pop3-setup/',
  
  common_issues: [
    'Connection refused: Bridge application not running',
    'Authentication failed: Use Bridge-generated password, not your account password',
    'Free plan: Bridge not available - upgrade to paid plan required',
    'Firewall blocking: Allow Bridge through firewall on ports 1143 and 1025'
  ],
  
  note: 'ProtonMail uses a different model than other providers. Bridge is required for IMAP/SMTP access due to end-to-end encryption.'
}
```

---

## Complete Provider List Template

Generate configurations for these popular providers:

### Consumer Email Providers
1. **Gmail** (Google) - OAuth + App Password
2. **Yahoo Mail** - OAuth + App Password, Passkey-heavy
3. **Outlook.com** (Microsoft) - OAuth + App Password
4. **iCloud Mail** (Apple) - App Password only
5. **AOL Mail** - App Password (similar to Yahoo)
6. **ProtonMail** - Bridge required
7. **FastMail** - App Password
8. **Zoho Mail** - App Password
9. **GMX Mail** - Basic auth (enable external apps)
10. **Mail.com** - Basic auth (enable IMAP/SMTP)

### Business/Enterprise Providers
11. **Microsoft 365** - OAuth preferred, App Password
12. **Google Workspace** - OAuth + App Password (admin policy dependent)
13. **Rackspace Email** - Basic auth
14. **Zimbra** - Basic auth

### Regional/Specialized
15. **Yandex Mail** (Russia) - Basic auth or App Password
16. **Mail.ru** (Russia) - Basic auth
17. **QQ Mail** (China) - App Password
18. **163 Mail** / **126 Mail** (NetEase, China) - Basic auth

---

## Validation Checklist

For each generated preset, verify:

### Technical Accuracy
- [ ] IMAP hostname resolves and responds
- [ ] SMTP hostname resolves and responds
- [ ] Ports are correct (993 IMAP SSL, 587 SMTP TLS standard)
- [ ] SSL/TLS settings match provider requirements

### User Experience
- [ ] Help text clearly explains app password vs regular password
- [ ] If passkeys common, explicitly mentions passkey users
- [ ] Step-by-step instructions numbered and clear
- [ ] Security URL is direct link (not generic homepage)
- [ ] Common issues address real user problems

### Security
- [ ] Recommends OAuth if supported
- [ ] Explains app password scope and security
- [ ] Links to official provider documentation
- [ ] Mentions 2FA requirements where applicable

### Completeness
- [ ] All required fields present
- [ ] Help text > 100 characters (detailed enough)
- [ ] At least 2 common issues documented
- [ ] Setup guide URL provided

---

## Testing Procedure

After generating a preset:

```bash
# Test IMAP connection
telnet imap.provider.com 993

# Test SMTP connection
telnet smtp.provider.com 587

# Verify SSL/TLS
openssl s_client -connect imap.provider.com:993

# Check OAuth endpoints (if supported)
curl https://provider.com/.well-known/oauth-authorization-server
```

---

## Common Patterns

### Pattern 1: Standard SSL/TLS Setup
```typescript
imap_port: 993,
imap_use_ssl: true,
smtp_port: 587,
smtp_use_tls: true,
```

### Pattern 2: App Password Required
```typescript
requires_app_password: true,
help_text: `Step-by-step guide with:
1. Link to security page
2. How to generate
3. Where to paste
4. Passkey clarification if relevant`
```

### Pattern 3: OAuth Supported
```typescript
supports_oauth: true,
oauth_provider: 'google' | 'microsoft' | 'yahoo',
note: 'Prefer OAuth over app passwords for better security'
```

---

## 🔗 Related Arsenal Items

**💭 Memory:**
- [Email Passkey Authentication](https://github.com/ChrisTansey007/windsurf-memories-arsenal/blob/main/development-tools/email-passkey-auth.md) - Complete passkey guide

**🔄 Workflows:**
- [OAuth Email Debug](https://github.com/ChrisTansey007/ai-workflows-arsenal/blob/main/windsurf/debugging/oauth-email-debug.md) - Debug OAuth issues

**⚙️ Rules:**
- [Email Documentation Standards](https://github.com/ChrisTansey007/ai-rules-arsenal/blob/main/windsurf/documentation/email-setup-docs.md) - Doc standards

**🔗 Example:**
- [Email Integration Example](https://github.com/ChrisTansey007/arsenal-integration-hub/tree/main/examples/email-integration) - Complete workflow

---

**Result: Generate complete, tested email provider configurations in minutes!** 📧
