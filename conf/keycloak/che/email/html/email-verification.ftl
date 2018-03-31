<html>
<head>
${msg("robotoFontIncludeStyle")}
</head>
<body style="${msg("mailBodyStyle")}">
    <#assign letterTitle=msg("emailVerificationTitle")>
    <#include "header.ftl">

    <div style="${msg("mailContentStyle")}">
        <p>${msg("emailVerificationLetterText")}</p>
        ${msg("button", msg('emailVerificationButtonText'), link)}
        <p>${msg("emailLinkExpirationText", linkExpiration)}</p>
    </div>

    <#include "footer.ftl">
</body>
</html>
