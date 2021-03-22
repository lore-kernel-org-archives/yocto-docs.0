Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.3.1616438080561393254
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Mar 2021 11:34:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=UWN8rTIw;
 spf=pass (domain: linaro.org, ip: 209.85.128.46, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f46.google.com with SMTP id n11-20020a05600c4f8bb029010e5cf86347so11424329wmq.1
        for <docs@lists.yoctoproject.org>; Mon, 22 Mar 2021 11:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=3bZrCSDKJt319QSe2hbv9PHRq8orqeOyvpZz7A3wSQI=;
        b=UWN8rTIwMfL56bPluLmvQZzOUYb5aEwCPodxxlZudpoacsz4EvEcxcBUMHD1BWuDWj
         A+ENedw66L9VA72sNHiiwsJ/IWuo2JogwJrgx5QIofw8CFx4k0c5ePxqMdAieKztK8NU
         sdCbCAupR5YfBRbyLAi+njVf7tAbJMDuX5MN112JrljoXNr1dFjUwDMDbHrNyuGdmSVQ
         o6arasgIa0J14arqJHioy3wPKk84C/REy7MeyDV4slQwQB5J3qZ8eFbaLYoAgD/icq+A
         teEmQeEDxtxxk1+n57/ATssaRIOJQYteCfj80dvW/60vKcR2IuyDGzvZ6GgWGp1WTX38
         SFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3bZrCSDKJt319QSe2hbv9PHRq8orqeOyvpZz7A3wSQI=;
        b=mvj+Qh7eLg2lM0v5ptL8d4mwWQh2q3U6ly/dR6N2dzxbbkow3ur/swn3Xyn5a0x66x
         qS/n9veqXkMh3U+OCHFNGPpcZwUSqoDFEvSnMwZO+iQyewqUqfMj2tHZM9SYYhcBb7Na
         qcZNNPcIdWhTmrDzPmZnABgeKis6DLmMDXeRYtkoSh6BpB/NL242nZtCN6t1LQ5D8Fa8
         VjrUDzv3Tqs1149Vlf/tXr8kZCCAHhOKaWWf3X2EsMrJhkB/NciKC+12x+LUR4Yzpd3+
         DBEoD/4Tii6oww06cn7+N0MPJ23H/g6QTNzYagvaINyll8gKTWvpikL2EjhYQyj29mBJ
         FWQQ==
X-Gm-Message-State: AOAM532FPSjYWTZmKvQ4h15OyHKRfeCSd8dcZUzN26garaUDgrjmUQ0W
	k/48VSA+yKhT4h6m9CO+Y9xT5FIqheJOJ5IX
X-Google-Smtp-Source: ABdhPJxrB9XOPAwcgBb0WSdJLnIEHXX8lPhzeEzE87GkiK2MR1YOOGwQnaXVqzGGks5c0c/ZAGKE3Q==
X-Received: by 2002:a7b:cc84:: with SMTP id p4mr356151wma.10.1616438078192;
        Mon, 22 Mar 2021 11:34:38 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from ?IPv6:2a01:e0a:1b9:3e10:97e3:5361:aa3:23fb? ([2a01:e0a:1b9:3e10:97e3:5361:aa3:23fb])
        by smtp.gmail.com with ESMTPSA id p18sm24557075wro.18.2021.03.22.11.34.37
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Mar 2021 11:34:37 -0700 (PDT)
Subject: Re: [docs] [PATCH] documentation/README minor improvements
To: docs@lists.yoctoproject.org
References: <20210322171725.78677-1-michael.opdenacker@bootlin.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Message-ID: <5f42e521-1c65-9905-eb56-0b2ad4967d1a@linaro.org>
Date: Mon, 22 Mar 2021 19:34:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210322171725.78677-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/22/21 6:17 PM, Michael Opdenacker wrote:
> - Minor style and spelling fixes
> - Add some extra details; add missing external link macros
>    and explain where they are defined
> - Correct where documentation can be found on the
>    Yocto Project website: the "Documentation" tab
>    has been replaced by "Docs" (and its later
>    shown as uppercase ("DOCS") by the current CSS, but this
>    may change one day.
> 
> These updates are not critical anyway, as this file is not part
> of the project documentation. It's the documentation of the
> documentation!

This shouldn't really be in commit log. If needed please add in the 
below section, so that it's stripped when the patch is applied.

Other than that, it looks good, thanks for the cleanup.	


> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/README | 27 ++++++++++++++++-----------
>   1 file changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/documentation/README b/documentation/README
> index be03bb119..0fa644c30 100644
> --- a/documentation/README
> +++ b/documentation/README
> @@ -47,7 +47,7 @@ Folders exist for individual manuals as follows:
>   Each folder is self-contained regarding content and figures.
>   
>   If you want to find HTML versions of the Yocto Project manuals on the web,
> -go to https://www.yoctoproject.org and click on the "Documentation" tab.  From
> +go to https://www.yoctoproject.org and click on the "Docs" tab.  From
>   there you have access to archived documentation from previous releases, current
>   documentation for the latest release, and "Docs in Progress" for the release
>   currently being developed.
> @@ -91,13 +91,13 @@ Yocto Project documentation website
>   A new website has been created to host the Yocto Project
>   documentation, it can be found at: https://docs.yoctoproject.org/.
>   
> -The entire Yocto Project documentation, as well as the BitBake manual
> +The entire Yocto Project documentation, as well as the BitBake manual,
>   is published on this website, including all previously released
>   versions. A version switcher was added, as a drop-down menu on the top
>   of the page to switch back and forth between the various versions of
>   the current active Yocto Project releases.
>   
> -Transition pages have been added (as rst file) to show links to old
> +Transition pages have been added (as rst files) to show links to old
>   versions of the Yocto Project documentation with links to each manual
>   generated with DocBook.
>   
> @@ -109,7 +109,7 @@ obvious reasons, we will only support building the Yocto Project
>   documentation with Python3.
>   
>   Sphinx might be available in your Linux distro packages repositories,
> -however it is not recommend using distro packages, as they might be
> +however it is not recommend to use distro packages, as they might be
>   old versions, especially if you are using an LTS version of your
>   distro. The recommended method to install Sphinx and all required
>   dependencies is to use the Python Package Index (pip).
> @@ -185,7 +185,7 @@ Sphinx has a glossary directive. From
>   https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.html#glossary:
>   
>       This directive must contain a reST definition list with terms and
> -    definitions. The definitions will then be referencable with the
> +    definitions. It's then possible to refer to each definition through the
>       [https://www.sphinx-doc.org/en/master/usage/restructuredtext/roles.html#role-term
>       'term' role].
>   
> @@ -206,7 +206,7 @@ however there are important shortcomings. For example they cannot be
>   used/nested inside code-block sections.
>   
>   A Sphinx extension was implemented to support variable substitutions
> -to mimic the DocBook based documentation behavior. Variabes
> +to mimic the DocBook based documentation behavior. Variable
>   substitutions are done while reading/parsing the .rst files. The
>   pattern for variables substitutions is the same as with DocBook,
>   e.g. `&VAR;`.
> @@ -237,14 +237,14 @@ Note directive
>   Sphinx has a builtin 'note' directive that produces clean Note section
>   in the output file. There are various types of directives such as
>   "attention", "caution", "danger", "error", "hint", "important", "tip",
> -"warning", "admonition" that are supported, and additional directive
> +"warning", "admonition" that are supported, and additional directives
>   can be added as Sphinx extension if needed.
>   
>   Figures
>   =======
>   
>   The Yocto Project documentation has many figures/images. Sphinx has a
> -'figure' directive which is straight forward to use. To include a
> +'figure' directive which is straightforward to use. To include a
>   figure in the body of the documentation:
>   
>     .. image:: figures/YP-flow-diagram.png
> @@ -262,7 +262,7 @@ https://sublime-and-sphinx-guide.readthedocs.io/en/latest/references.html.
>   References
>   ==========
>   
> -The following extension is enabed by default:
> +The following extension is enabled by default:
>   sphinx.ext.autosectionlabel
>   (https://www.sphinx-doc.org/en/master/usage/extensions/autosectionlabel.html).
>   
> @@ -271,7 +271,7 @@ autosectionlabel_prefix_document is enabled by default, so that we can
>   insert references from any document.
>   
>   For example, to insert an HTML link to a section from
> -documentaion/manual/intro.rst, use:
> +documentation/manual/intro.rst, use:
>   
>     Please check this :ref:`manual/intro:Cross-References to Locations in the Same Document`
>   
> @@ -294,7 +294,8 @@ Extlinks
>   
>   The sphinx.ext.extlinks extension is enabled by default
>   (https://sublime-and-sphinx-guide.readthedocs.io/en/latest/references.html#use-the-external-links-extension),
> -and it is configured with:
> +and it is configured with the 'extlinks' definitions in
> +the 'documentation/conf.py' file:
>   
>     'yocto_home': ('https://yoctoproject.org%s', None),
>     'yocto_wiki': ('https://wiki.yoctoproject.org%s', None),
> @@ -306,6 +307,10 @@ and it is configured with:
>     'yocto_git': ('https://git.yoctoproject.org%s', None),
>     'oe_home': ('https://www.openembedded.org%s', None),
>     'oe_lists': ('https://lists.openembedded.org%s', None),
> +  'oe_git': ('https://git.openembedded.org%s', None),
> +  'oe_wiki': ('https://www.openembedded.org/wiki%s', None),
> +  'oe_layerindex': ('https://layers.openembedded.org%s', None),
> +  'oe_layer': ('https://layers.openembedded.org/layerindex/branch/master/layer%s', None),
>   
>   It creates convenient shortcuts which can be used throughout the
>   documentation rst files, as:
> 
> 
> 
> 
> 

