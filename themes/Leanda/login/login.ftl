<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",(realm.displayName!""))}
    <#elseif section = "header">
        ${msg("loginTitleHtml",(realm.displayNameHtml!""))?no_esc}
    <#elseif section = "form">
        <#if realm.password>
            <div class="card-panel row">
                <div class="card-title row">
                    <div class="row valign-wrapper">
                        <div class="col s2">
                            <img class="kc-logo responsive-img valign" src="${url.resourcesPath}/img/osdr-logo.png"/>
                        </div>
                        <div class="col s10">
                            <h5>${properties.kcLoginText!}</h5>
                        </div>
                    </div>
                </div>
                <div class="card-content row">
                    <form id="kc-form-login" class="" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post" autocomplete="off">
                        <div class="input-field">
                            <#if usernameEditDisabled??>
                                <input tabindex="1" id="username" class="validate" name="username" value="${(login.username!"")}" type="text" disabled />
                                <label for="username">
                                <#if !realm.loginWithEmailAllowed>
                                    ${msg("username")}
                                <#elseif !realm.registrationEmailAsUsername>
                                    ${msg("usernameOrEmail")}
                                <#else>
                                    ${msg("email")}
                                </#if>
                                </label>
                            <#else>
                                <input tabindex="1" id="username" class="validate" name="username" value="${(login.username!"")}" type="text" autofocus autocomplete="off" />
                                <label for="username" class="">
                                <#if !realm.loginWithEmailAllowed>
                                    ${msg("username")}
                                <#elseif !realm.registrationEmailAsUsername>
                                    ${msg("usernameOrEmail")}
                                <#else>
                                    ${msg("email")}
                                </#if>
                                </label>
                            </#if>
                        </div>
                        <div class="input-field">
                            <input tabindex="2" id="password" class="validate" name="password" type="password" autocomplete="off" />
                            <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                        </div>
                        <div id="kc-form-options" class="${properties.kcFormOptionsClass!} s12 left-align">
                            <#if realm.rememberMe && !usernameEditDisabled??> 
                                <label>
                                    <#if login.rememberMe??>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" class="filled-in" checked> 
                                        <span>${msg("rememberMe")}</span>
                                    <#else>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" class="filled-in">
                                        <span>${msg("rememberMe")}</span>
                                    </#if>
                                </label>
                            </#if>
                            <div class="${properties.kcFormOptionsWrapperClass!}">
                                <#if realm.resetPasswordAllowed>
                                    <span><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                                </#if>
                            </div>
                        </div>
                        <div class="card-action">
                            <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                                <button tabindex="4" type="submit" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}" class="col s12 btn btn-large waves-effect teal">Login</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </#if>
        <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
            <div id="kc-registration">
                <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
            </div>
        </#if>

        <#if realm.password && social.providers??>
            <div id="kc-social-providers">
                <ul>
                    <#list social.providers as p>
                        <li><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span class="text">${p.displayName}</span></a></li>
                    </#list>
                </ul>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>