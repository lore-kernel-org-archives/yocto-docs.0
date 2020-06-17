Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web11.471.1592413744419497730
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Jun 2020 10:09:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ePhcmNTW;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id j4so1227961plk.3
        for <docs@lists.yoctoproject.org>; Wed, 17 Jun 2020 10:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=DEs46hp49RMXDh0Phwj4CeyRhPdPnQ9ysJrAtVDBuLc=;
        b=ePhcmNTWt42u8oxZYzp2Iqidh+AbFplvj0vgBXs5QGOUVaC+Gn9lBBPlEzhhmP6u5u
         sIR5hEEUspRKEPT15NvQVF8DfD5PS4uQe8gb6e/VuMVn4VmzgpAHkMLrLTZMbhH5N0gw
         10QT85480ZGfaQA17+mSKOS83SHSjxNTchcfvTKJIVQxGZaFuIZIejGawXYCBKs1zqP3
         gwpsGH5q/kgP3LV7IsHETjZo60dSeojQr7DSRvaGJAERqgw/iodVZJ6uC9H6aFqq4oXK
         WPrEI7COK0jmSKBD+ds7793W1A27/1lHDCTxUSd257GNoU2SV/ZNof0kYpT3R+i4GLP4
         ++ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=DEs46hp49RMXDh0Phwj4CeyRhPdPnQ9ysJrAtVDBuLc=;
        b=E0ldu/Hb2fV4jw3uCaNWw87Fhw9r8lU5Hdy3bLkAd59x9NvexxytqMU7MUOLJY0QoQ
         U3ZH0X+vR1HcwFm/jUDeaK3n82Z6oaaUDWZ4QcQZGDvNIgW3Ki8ARWVasUfciFDWogwG
         H/4FYNzmCznG99nOQprfk/K2eI3wDlpUJxT0JTnkpB3lpsiXSrfjnAcJokKEUpLTcXAZ
         uCRBqsUIhFFVUI+lBSpyYatqw2BiNys0EpvIRKPmNeso8xTMYSjIrFJLlnwMKnmbxiUf
         l/y+zUMn76hUkx+ZowMViwipcuhWjbJfmErMKGp2T6GGRkhFk7f3oPm9/LTomBoEmxdh
         RbMQ==
X-Gm-Message-State: AOAM532CnKGOnYeufZSZrLEqN9Wes3bX/ROvW5OSCnxcAiz/mEFsZ+x7
	mGR0y2nu4eUWDL5us/z/cFkuw/tQ
X-Google-Smtp-Source: ABdhPJyCXyLM2uRw38rPfwpx2dMHgSrDLe9oQXOVfFgKJtuLsHhT0k0iWhK7vTPVWk75D9qtd4S9VA==
X-Received: by 2002:a17:902:a412:: with SMTP id p18mr12041plq.341.1592413743640;
        Wed, 17 Jun 2020 10:09:03 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:468:ee15:d722:3a6e? ([2601:202:4180:a5c0:468:ee15:d722:3a6e])
        by smtp.gmail.com with ESMTPSA id 140sm402519pfz.154.2020.06.17.10.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2020 10:09:02 -0700 (PDT)
Subject: Re: [docs] [PATCH 4/4] Makefile: Drop obsolete edison/denzil branch conditionals
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
References: <20200617154422.417466-1-richard.purdie@linuxfoundation.org>
 <20200617154422.417466-4-richard.purdie@linuxfoundation.org>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <02ae490f-923a-bc7d-b67b-07c570e0ff96@gmail.com>
Date: Wed, 17 Jun 2020 10:09:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200617154422.417466-4-richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative;
 boundary="------------48B8A18806C0D20E8239A5DB"
Content-Language: en-US

--------------48B8A18806C0D20E8239A5DB
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

hmm, I am sure I sent a patch to do this a while back, was there a problem ?

https://lists.yoctoproject.org/g/docs/message/162

-aarmin

On 6/17/20 8:44 AM, Richard Purdie wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  documentation/Makefile | 54 ------------------------------------------
>  1 file changed, 54 deletions(-)
>
> diff --git a/documentation/Makefile b/documentation/Makefile
> index 6a369637f..7d4058ae7 100644
> --- a/documentation/Makefile
> +++ b/documentation/Makefile
> @@ -140,32 +140,10 @@ ALLPREQ = html tarball
>  # This would be appropriate for "master" branch.
>  #
>  
> -	ifeq ($(BRANCH),edison)
> -TARFILES = dev-style.css dev-manual.html \
> -           figures/app-dev-flow.png figures/bsp-dev-flow.png \
> -           figures/dev-title.png figures/git-workflow.png \
> -           figures/index-downloads.png figures/kernel-dev-flow.png \
> -           figures/kernel-example-repos-edison.png \
> -           figures/kernel-overview-1.png figures/kernel-overview-2.png \
> -           figures/kernel-overview-3-edison.png \
> -           figures/source-repos.png figures/yp-download.png \
> -           figures/wip.png
> -	else ifeq ($(BRANCH),denzil)
> -TARFILES = dev-style.css dev-manual.html \
> -           figures/app-dev-flow.png figures/bsp-dev-flow.png \
> -           figures/dev-title.png figures/git-workflow.png \
> -           figures/index-downloads.png figures/kernel-dev-flow.png \
> -           figures/kernel-example-repos-denzil.png \
> -           figures/kernel-overview-1.png figures/kernel-overview-2.png \
> -           figures/kernel-overview-3-denzil.png \
> -           figures/source-repos.png figures/yp-download.png \
> -           figures/wip.png
> -        else
>  TARFILES = dev-style.css dev-manual.html figures/buildhistory-web.png \
>             figures/dev-title.png figures/buildhistory.png \
>             figures/recipe-workflow.png figures/bitbake-build-flow.png \
>             figures/multiconfig_files.png figures/cute-files-npm-example.png
> -	endif
>  
>  MANUALS = $(DOC)/$(DOC).html
>  FIGURES = figures
> @@ -181,37 +159,6 @@ XSLTOPTS = --stringparam html.stylesheet mega-style.css \
>             --xinclude
>  ALLPREQ = html tarball
>  
> -	ifeq ($(BRANCH),edison)
> -TARFILES = mega-manual.html mega-style.css figures/yocto-environment.png \
> -        figures/building-an-image.png  \
> -	figures/using-a-pre-built-image.png \
> -	figures/poky-title.png \
> -	figures/adt-title.png figures/bsp-title.png \
> -	figures/kernel-title.png figures/kernel-architecture-overview.png \
> -	figures/app-dev-flow.png figures/bsp-dev-flow.png \
> -        figures/dev-title.png figures/git-workflow.png \
> -        figures/index-downloads.png figures/kernel-dev-flow.png \
> -	figures/kernel-example-repos-edison.png \
> -	figures/kernel-overview-1.png figures/kernel-overview-2.png \
> -	figures/kernel-overview-3-edison.png \
> -	figures/source-repos.png figures/yp-download.png \
> -	figures/wip.png
> -	else ifeq ($(BRANCH),denzil)
> -TARFILES = mega-manual.html mega-style.css figures/yocto-environment.png \
> -        figures/building-an-image.png  \
> -	figures/using-a-pre-built-image.png \
> -	figures/poky-title.png \
> -	figures/adt-title.png figures/bsp-title.png \
> -	figures/kernel-title.png figures/kernel-architecture-overview.png \
> -	figures/app-dev-flow.png figures/bsp-dev-flow.png \
> -        figures/dev-title.png figures/git-workflow.png \
> -        figures/index-downloads.png figures/kernel-dev-flow.png \
> -	figures/kernel-example-repos-denzil.png \
> -	figures/kernel-overview-1.png figures/kernel-overview-2.png \
> -	figures/kernel-overview-3-denzil.png \
> -	figures/source-repos.png figures/yp-download.png \
> -	figures/wip.png
> -        else
>  TARFILES = mega-manual.html mega-style.css \
>          figures/YP-flow-diagram.png \
>  	figures/using-a-pre-built-image.png \
> @@ -269,7 +216,6 @@ TARFILES = mega-manual.html mega-style.css \
>  	figures/sdk-devtool-upgrade-flow.png figures/bitbake-build-flow.png figures/bypqs-title.png \
>  	figures/overview-manual-title.png figures/sdk-autotools-flow.png figures/sdk-makefile-flow.png \
>  	figures/bb_multiconfig_files.png figures/bitbake-title.png figures/cute-files-npm-example.png
> -	endif
>  
>  MANUALS = $(DOC)/$(DOC).html
>  FIGURES = figures
>
> 


--------------48B8A18806C0D20E8239A5DB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    hmm, I am sure I sent a patch to do this a while back, was there a
    problem ?<br>
    <br>
    <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/docs/message/162">https://lists.yoctoproject.org/g/docs/message/162</a><br>
    <br>
    -aarmin<br>
    <br>
    <div class="moz-cite-prefix">On 6/17/20 8:44 AM, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200617154422.417466-4-richard.purdie@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Richard Purdie <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a>
---
 documentation/Makefile | 54 ------------------------------------------
 1 file changed, 54 deletions(-)

diff --git a/documentation/Makefile b/documentation/Makefile
index 6a369637f..7d4058ae7 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -140,32 +140,10 @@ ALLPREQ = html tarball
 # This would be appropriate for "master" branch.
 #
 
-	ifeq ($(BRANCH),edison)
-TARFILES = dev-style.css dev-manual.html \
-           figures/app-dev-flow.png figures/bsp-dev-flow.png \
-           figures/dev-title.png figures/git-workflow.png \
-           figures/index-downloads.png figures/kernel-dev-flow.png \
-           figures/kernel-example-repos-edison.png \
-           figures/kernel-overview-1.png figures/kernel-overview-2.png \
-           figures/kernel-overview-3-edison.png \
-           figures/source-repos.png figures/yp-download.png \
-           figures/wip.png
-	else ifeq ($(BRANCH),denzil)
-TARFILES = dev-style.css dev-manual.html \
-           figures/app-dev-flow.png figures/bsp-dev-flow.png \
-           figures/dev-title.png figures/git-workflow.png \
-           figures/index-downloads.png figures/kernel-dev-flow.png \
-           figures/kernel-example-repos-denzil.png \
-           figures/kernel-overview-1.png figures/kernel-overview-2.png \
-           figures/kernel-overview-3-denzil.png \
-           figures/source-repos.png figures/yp-download.png \
-           figures/wip.png
-        else
 TARFILES = dev-style.css dev-manual.html figures/buildhistory-web.png \
            figures/dev-title.png figures/buildhistory.png \
            figures/recipe-workflow.png figures/bitbake-build-flow.png \
            figures/multiconfig_files.png figures/cute-files-npm-example.png
-	endif
 
 MANUALS = $(DOC)/$(DOC).html
 FIGURES = figures
@@ -181,37 +159,6 @@ XSLTOPTS = --stringparam html.stylesheet mega-style.css \
            --xinclude
 ALLPREQ = html tarball
 
-	ifeq ($(BRANCH),edison)
-TARFILES = mega-manual.html mega-style.css figures/yocto-environment.png \
-        figures/building-an-image.png  \
-	figures/using-a-pre-built-image.png \
-	figures/poky-title.png \
-	figures/adt-title.png figures/bsp-title.png \
-	figures/kernel-title.png figures/kernel-architecture-overview.png \
-	figures/app-dev-flow.png figures/bsp-dev-flow.png \
-        figures/dev-title.png figures/git-workflow.png \
-        figures/index-downloads.png figures/kernel-dev-flow.png \
-	figures/kernel-example-repos-edison.png \
-	figures/kernel-overview-1.png figures/kernel-overview-2.png \
-	figures/kernel-overview-3-edison.png \
-	figures/source-repos.png figures/yp-download.png \
-	figures/wip.png
-	else ifeq ($(BRANCH),denzil)
-TARFILES = mega-manual.html mega-style.css figures/yocto-environment.png \
-        figures/building-an-image.png  \
-	figures/using-a-pre-built-image.png \
-	figures/poky-title.png \
-	figures/adt-title.png figures/bsp-title.png \
-	figures/kernel-title.png figures/kernel-architecture-overview.png \
-	figures/app-dev-flow.png figures/bsp-dev-flow.png \
-        figures/dev-title.png figures/git-workflow.png \
-        figures/index-downloads.png figures/kernel-dev-flow.png \
-	figures/kernel-example-repos-denzil.png \
-	figures/kernel-overview-1.png figures/kernel-overview-2.png \
-	figures/kernel-overview-3-denzil.png \
-	figures/source-repos.png figures/yp-download.png \
-	figures/wip.png
-        else
 TARFILES = mega-manual.html mega-style.css \
         figures/YP-flow-diagram.png \
 	figures/using-a-pre-built-image.png \
@@ -269,7 +216,6 @@ TARFILES = mega-manual.html mega-style.css \
 	figures/sdk-devtool-upgrade-flow.png figures/bitbake-build-flow.png figures/bypqs-title.png \
 	figures/overview-manual-title.png figures/sdk-autotools-flow.png figures/sdk-makefile-flow.png \
 	figures/bb_multiconfig_files.png figures/bitbake-title.png figures/cute-files-npm-example.png
-	endif
 
 MANUALS = $(DOC)/$(DOC).html
 FIGURES = figures
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------48B8A18806C0D20E8239A5DB--
