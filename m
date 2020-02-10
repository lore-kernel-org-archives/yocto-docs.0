Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web09.829.1581354056865568480
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Feb 2020 09:00:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jmYonJPh;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id y5so3976198pfb.11
        for <docs@lists.yoctoproject.org>; Mon, 10 Feb 2020 09:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=+3ZZSHSh+lbJE1I177dLOLDZAXpkdIsspqMnC+KYFiw=;
        b=jmYonJPhZNzRoWliB9n7mzZ28rrDLQll0cAx1zpLcDR3fnTK4PIR23hpFhIvdytw8G
         HMao888zlXL+ZH9buqI2HPoayMAURArbiSu0phBa/sQEDUTwTCgUMU0RjxsxofdwzvvI
         VmGiOowiyuwT2bWhvrMvU6Ubu/3sLW7/Emh2g9vpFYTR52prt87chvjFp4DfYBIran/3
         by39i1reiN3SFOl3NgapASfXvLxoG+1X1xIPvQPn/fovU7WJU/wpJaio0yemolK5AZPd
         273FZC8a25igJFKhZtrPIZFlKv8oofpys+9UIgvSZphPrdaDHC3shX+U6DgrAq5HFW+i
         t2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=+3ZZSHSh+lbJE1I177dLOLDZAXpkdIsspqMnC+KYFiw=;
        b=m3TA4t5f9/PzPKaiPp28PooLBZtpP02rtAdYZgSWx/Y5WVNnDBeCVFvHLVMivywm2x
         66jGbUUORdedE/5LmRBDeSkREMt3LThLoU/hI5/yc/tcCxp+l2QlFKAcofhbIbJfXAD+
         /FrExjmRU64HjCYqL/VN/2ze3EEAAsxjnI7S6PwfNSee5KhZF8XLJeZMcp1oUcuZiJLS
         mWm4gf20Yx2UmHwxOzaH0pnnswQKEQGl1Op9E5SsAVgiDJsrJhH+wn0Nu8fHYo/+M1Pb
         P6Zt0i8+uxPJzImMXqDljAqX0tZM8P4H58osYIIZBO1R8OSNMY/N71i5IKq6b+1VssOV
         P3Gg==
X-Gm-Message-State: APjAAAXKhtUSSvhTnUInLLgpu7JhYeC6X+QIXBZt2jhrSzMohvSmirdZ
	f/pdgyX5GivaXS6vbqYup8lhiVlE
X-Google-Smtp-Source: APXvYqzj2ZibbTUzCLsZoc9OeqIDk8HMpgyf2wYYgSUJiwztQYM/9M5StvQWJmQL5BraK+Z+uH6P9g==
X-Received: by 2002:a63:34e:: with SMTP id 75mr2695154pgd.286.1581354055984;
        Mon, 10 Feb 2020 09:00:55 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:58cf:c2e4:7ede:a168? ([2601:202:4180:a5c0:58cf:c2e4:7ede:a168])
        by smtp.gmail.com with ESMTPSA id t28sm991857pfq.122.2020.02.10.09.00.55
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2020 09:00:55 -0800 (PST)
Subject: Re: [docs] [PATCH] README: A couple of updates due to recent changes
To: docs@lists.yoctoproject.org
References: <20200210033743.24295-1-tanuk@iki.fi>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <f2b93c68-e11f-0007-f2e9-1cb5403461d0@gmail.com>
Date: Mon, 10 Feb 2020 09:00:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200210033743.24295-1-tanuk@iki.fi>
Content-Type: multipart/alternative;
 boundary="------------77E48D65679471A8F2035F76"
Content-Language: en-US

--------------77E48D65679471A8F2035F76
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 2/9/20 7:37 PM, Tanu Kaskinen wrote:
> Since there's now a separate mailing list for docs, I think the
> yocto-docs tag doesn't need to be added to patches any more.
>
> ---
>
>  README | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/README b/README
> index 62c2a3ffb..6a7f3abe6 100644
> --- a/README
> +++ b/README
> @@ -11,15 +11,13 @@ Where to Send Patches
>  =====================
>  
>  When sending single patches, please using something like:
> -'git send-email -1 --to docs@lists.yoctoproject.org --subject-prefix=yocto-docs][PATCH'
> +'git send-email -1 --to docs@lists.yoctoproject.org
We still need a subject
>  
> -These values can be set as defaults for this repository:
> +The To header can be set as default for this repository:
>  
>  $ git config sendemail.to docs@lists.yoctoproject.org
> -$ git config format.subjectPrefix yocto-docs][PATCH
We still need a subject
>  
>  Now you can just do 'git send-email origin/master' to send all local patches.
>  
>  Git repository: http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/
>  Mailing list: docs@lists.yoctoproject.org
> -Please cc: Scott Rifenbark <srifenbark@gmail.com> on changes.
>
> 


--------------77E48D65679471A8F2035F76
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 2/9/20 7:37 PM, Tanu Kaskinen wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200210033743.24295-1-tanuk@iki.fi">
      <pre class="moz-quote-pre" wrap="">Since there's now a separate mailing list for docs, I think the
yocto-docs tag doesn't need to be added to patches any more.

---

 README | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/README b/README
index 62c2a3ffb..6a7f3abe6 100644
--- a/README
+++ b/README
@@ -11,15 +11,13 @@ Where to Send Patches
 =====================
 
 When sending single patches, please using something like:
-'git send-email -1 --to <a class="moz-txt-link-abbreviated" href="mailto:docs@lists.yoctoproject.org">docs@lists.yoctoproject.org</a> --subject-prefix=yocto-docs][PATCH'
+'git send-email -1 --to <a class="moz-txt-link-abbreviated" href="mailto:docs@lists.yoctoproject.org">docs@lists.yoctoproject.org</a></pre>
    </blockquote>
    We still need a subject<br>
    <blockquote type="cite"
      cite="mid:20200210033743.24295-1-tanuk@iki.fi">
      <pre class="moz-quote-pre" wrap=""> 
-These values can be set as defaults for this repository:
+The To header can be set as default for this repository:
 
 $ git config sendemail.to <a class="moz-txt-link-abbreviated" href="mailto:docs@lists.yoctoproject.org">docs@lists.yoctoproject.org</a>
-$ git config format.subjectPrefix yocto-docs][PATCH</pre>
    </blockquote>
    We still need a subject<br>
    <blockquote type="cite"
      cite="mid:20200210033743.24295-1-tanuk@iki.fi">
      <pre class="moz-quote-pre" wrap="">
 
 Now you can just do 'git send-email origin/master' to send all local patches.
 
 Git repository: <a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/">http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/</a>
 Mailing list: <a class="moz-txt-link-abbreviated" href="mailto:docs@lists.yoctoproject.org">docs@lists.yoctoproject.org</a>
-Please cc: Scott Rifenbark <a class="moz-txt-link-rfc2396E" href="mailto:srifenbark@gmail.com">&lt;srifenbark@gmail.com&gt;</a> on changes.
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------77E48D65679471A8F2035F76--
