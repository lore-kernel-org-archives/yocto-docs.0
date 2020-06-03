Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.1134.1591206061089890294
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Jun 2020 10:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qv+vlGLC;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id 23so1179009pfw.10
        for <docs@lists.yoctoproject.org>; Wed, 03 Jun 2020 10:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=8Cvxj4eJXGX/lnQBYzrn6c/cHH5+ja93TcyOi56+S/I=;
        b=qv+vlGLCFUhyoRx0UqvWe0xeZu08eGBElKTNuJE6Pda2OwRsMlbD3+P8jgUxcK9bqB
         RhBt03YtC6uYgN2erDgCAWVGXkn2pXi5/EY2hlADq03YcxaD7G3lOiyOayCTxEeZk0Ls
         t0zg74JYmJR3mP1t6cCpbtUPI7tY1gYV1BImpeQBeVvK6Xi9/wDQx61VDC7bLX5BBDIR
         oqivANkDliBZFH9cKifLhVm6i9fGVvvSdahKv835Ph3j6eHIF/cfSycV7jdeNv0t5q46
         Uqayeub+gIrQgkAIhRsmxiV7y+0K1bKKQVgYncrn+tdK+jNVSK4TKaJo1+apZ2yw45w2
         JrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=8Cvxj4eJXGX/lnQBYzrn6c/cHH5+ja93TcyOi56+S/I=;
        b=Ia8wQbVmKCQXHY/ox/U/9cFlO2G8JS5s7iJSbGjjMIM77hRM3FEvSDOrvJ428ecsn1
         2aDYlYZpovlVXfNW1aNhazgoG/z8P7Lp1Bo6xzYxBJiuS8UR/r0Bf6TgrD2bEWa3yzeL
         u7O418wXbxStDfHDOD2hkEVh6HRiyCvoyck1g6A166N6p70k9Fthl5Uuktu+MpuCZtbh
         OtE8/tnN3CXCyHV7yxOcr++WPPzyGAcA0L0xwEyDMBzPc4obvAgFYys2wjbUy35uiVQO
         xvtLejbHbiI64v5Hcp86paVT9iAIP0lQ3vYb2TqVRR3HOHEKAKXkmjmM2UV67GebLSzV
         wrDQ==
X-Gm-Message-State: AOAM530yRpPiSdnjTBXbdppSEKjBUsm8S2AO5tHvfJDI2FB4netp6VZ+
	Wlvsp3Qg9UPFEiW2FjnGsfxDY4tz
X-Google-Smtp-Source: ABdhPJwDErWHGHgW9Mx0bimXm6RguR7f1+KhoNSODaMSmjJIFj4klgPmtl4dCaTgyg4xUarfHFLiRw==
X-Received: by 2002:a17:90a:73cb:: with SMTP id n11mr1130185pjk.234.1591206060100;
        Wed, 03 Jun 2020 10:41:00 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:7c6f:fec8:5548:f4b0? ([2601:202:4180:a5c0:7c6f:fec8:5548:f4b0])
        by smtp.gmail.com with ESMTPSA id i26sm2376601pfo.0.2020.06.03.10.40.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2020 10:40:59 -0700 (PDT)
Subject: Re: [docs] [yocto-docs][dunfell 6/6] Documenation: Prepared for the 3.1.1 release
To: Steve Sakoman <steve@sakoman.com>, docs@lists.yoctoproject.org
References: <cover.1591057623.git.steve@sakoman.com>
 <069c27574bf7333cdf58d9920734bb33c81ecc93.1591057623.git.steve@sakoman.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <d0fa32a3-b193-51de-46c7-750d42c7ed4b@gmail.com>
Date: Wed, 3 Jun 2020 10:40:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <069c27574bf7333cdf58d9920734bb33c81ecc93.1591057623.git.steve@sakoman.com>
Content-Type: multipart/alternative;
 boundary="------------67C90B99143473B75F9E0791"
Content-Language: en-US

--------------67C90B99143473B75F9E0791
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

I think you are missing some updates, please check these files:

./kernel-dev/kernel-dev.xml
./ref-manual/ref-manual.xml
./sdk-manual/sdk-manual.xml
./overview-manual/overview-manual.xml

- armin

On 6/1/20 5:28 PM, Steve Sakoman wrote:
> ---
>  documentation/bsp-guide/bsp-guide.xml         |  7 ++-
>  documentation/dev-manual/dev-manual.xml       |  7 ++-
>  documentation/mega-manual/mega-manual.xml     |  7 ++-
>  documentation/poky.ent                        | 14 +++---
>  .../profile-manual/profile-manual.xml         |  7 ++-
>  .../toaster-manual/toaster-manual.xml         |  7 ++-
>  documentation/tools/mega-manual.sed           | 46 +++++++++----------
>  7 files changed, 60 insertions(+), 35 deletions(-)
>
> diff --git a/documentation/bsp-guide/bsp-guide.xml b/documentation/bsp-guide/bsp-guide.xml
> index a189606ce..6ab89d653 100755
> --- a/documentation/bsp-guide/bsp-guide.xml
> +++ b/documentation/bsp-guide/bsp-guide.xml
> @@ -127,9 +127,14 @@
>              </revision>
>              <revision>
>                  <revnumber>3.1</revnumber>
> -                <date>&REL_MONTH_YEAR;</date>
> +                <date>April 2020</date>
>                  <revremark>Released with the Yocto Project 3.1 Release.</revremark>
>              </revision>
> +            <revision>
> +                <revnumber>3.1.1</revnumber>
> +                <date>&REL_MONTH_YEAR;</date>
> +                <revremark>Released with the Yocto Project 3.1.1 Release.</revremark>
> +            </revision>
>          </revhistory>
>  
>      <copyright>
> diff --git a/documentation/dev-manual/dev-manual.xml b/documentation/dev-manual/dev-manual.xml
> index 6f86454ed..5c6b3457f 100755
> --- a/documentation/dev-manual/dev-manual.xml
> +++ b/documentation/dev-manual/dev-manual.xml
> @@ -117,9 +117,14 @@
>              </revision>
>              <revision>
>                  <revnumber>3.1</revnumber>
> -                <date>&REL_MONTH_YEAR;</date>
> +                <date>April 2020</date>
>                  <revremark>Released with the Yocto Project 3.1 Release.</revremark>
>              </revision>
> +            <revision>
> +                <revnumber>3.1.1</revnumber>
> +                <date>&REL_MONTH_YEAR;</date>
> +                <revremark>Released with the Yocto Project 3.1.1 Release.</revremark>
> +            </revision>
>          </revhistory>
>  
>      <copyright>
> diff --git a/documentation/mega-manual/mega-manual.xml b/documentation/mega-manual/mega-manual.xml
> index e730f7259..a20843fc1 100755
> --- a/documentation/mega-manual/mega-manual.xml
> +++ b/documentation/mega-manual/mega-manual.xml
> @@ -93,9 +93,14 @@
>              </revision>
>              <revision>
>                  <revnumber>3.1</revnumber>
> -                <date>&REL_MONTH_YEAR;</date>
> +                <date>April 2020</date>
>                  <revremark>Released with the Yocto Project 3.1 Release.</revremark>
>              </revision>
> +            <revision>
> +                <revnumber>3.1.1</revnumber>
> +                <date>&REL_MONTH_YEAR;</date>
> +                <revremark>Released with the Yocto Project 3.1.1 Release.</revremark>
> +            </revision>
>         </revhistory>
>  
>      <copyright>
> diff --git a/documentation/poky.ent b/documentation/poky.ent
> index a54793911..0a0deab8f 100755
> --- a/documentation/poky.ent
> +++ b/documentation/poky.ent
> @@ -1,17 +1,17 @@
> -<!ENTITY DISTRO "3.1">
> -<!ENTITY DISTRO_COMPRESSED "31">
> +<!ENTITY DISTRO "3.1.1">
> +<!ENTITY DISTRO_COMPRESSED "311">
>  <!ENTITY DISTRO_NAME_NO_CAP "dunfell">
>  <!ENTITY DISTRO_NAME "Dunfell">
>  <!ENTITY DISTRO_NAME_NO_CAP_MINUS_ONE "zeus">
>  <!ENTITY DISTRO_NAME_MINUS_ONE "Zeus">
> -<!ENTITY YOCTO_DOC_VERSION "3.1">
> +<!ENTITY YOCTO_DOC_VERSION "3.1.1">
>  <!ENTITY YOCTO_DOC_VERSION_MINUS_ONE "3.0.2">
> -<!ENTITY DISTRO_REL_TAG "yocto-3.1">
> +<!ENTITY DISTRO_REL_TAG "yocto-3.1.1">
>  <!ENTITY METAINTELVERSION "12.0">
> -<!ENTITY REL_MONTH_YEAR "April 2020">
> +<!ENTITY REL_MONTH_YEAR "June 2020">
>  <!ENTITY META_INTEL_REL_TAG "&METAINTELVERSION;-&DISTRO_NAME_NO_CAP;-&YOCTO_DOC_VERSION;">
> -<!ENTITY POKYVERSION "23.0.0">
> -<!ENTITY POKYVERSION_COMPRESSED "2300">
> +<!ENTITY POKYVERSION "23.0.1">
> +<!ENTITY POKYVERSION_COMPRESSED "2301">
>  <!ENTITY YOCTO_POKY "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;">
>  <!ENTITY COPYRIGHT_YEAR "2010-2020">
>  <!ENTITY ORGNAME "The Yocto Project">
> diff --git a/documentation/profile-manual/profile-manual.xml b/documentation/profile-manual/profile-manual.xml
> index fa1fa8ac8..710fb770e 100755
> --- a/documentation/profile-manual/profile-manual.xml
> +++ b/documentation/profile-manual/profile-manual.xml
> @@ -102,9 +102,14 @@
>              </revision>
>              <revision>
>                  <revnumber>3.1</revnumber>
> -                <date>&REL_MONTH_YEAR;</date>
> +                <date>April 2020</date>
>                  <revremark>Released with the Yocto Project 3.1 Release.</revremark>
>              </revision>
> +            <revision>
> +                <revnumber>3.1.1</revnumber>
> +                <date>&REL_MONTH_YEAR;</date>
> +                <revremark>Released with the Yocto Project 3.1.1 Release.</revremark>
> +            </revision>
>          </revhistory>
>  
>      <copyright>
> diff --git a/documentation/toaster-manual/toaster-manual.xml b/documentation/toaster-manual/toaster-manual.xml
> index e6d424523..53d666446 100755
> --- a/documentation/toaster-manual/toaster-manual.xml
> +++ b/documentation/toaster-manual/toaster-manual.xml
> @@ -82,9 +82,14 @@
>              </revision>
>              <revision>
>                  <revnumber>3.1</revnumber>
> -                <date>&REL_MONTH_YEAR;</date>
> +                <date>April 2020</date>
>                  <revremark>Released with the Yocto Project 3.1 Release.</revremark>
>              </revision>
> +            <revision>
> +                <revnumber>3.1.1</revnumber>
> +                <date>&REL_MONTH_YEAR;</date>
> +                <revremark>Released with the Yocto Project 3.1.1 Release.</revremark>
> +            </revision>
>         </revhistory>
>  
>      <copyright>
> diff --git a/documentation/tools/mega-manual.sed b/documentation/tools/mega-manual.sed
> index b1ea9edb7..d52f1ebdb 100644
> --- a/documentation/tools/mega-manual.sed
> +++ b/documentation/tools/mega-manual.sed
> @@ -1,36 +1,36 @@
>  # Processes bitbake-user-manual (<word>-<word>-<word> style).
>  # This style is for manual three-word folders, which currently is only the BitBake User Manual.
>  # We used to have the "yocto-project-qs" and "poky-ref-manual" folders but no longer do.
> -# s@"ulink" href="http://www.yoctoproject.org/docs/3.1/[a-z]*-[a-z]*-[a-z]*/[a-z]*-[a-z]*-[a-z]*.html#@"link" href="#@g
> -s@"ulink" href="http://www.yoctoproject.org/docs/3.1/bitbake-user-manual/bitbake-user-manual.html#@"link" href="#@g
> +# s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/[a-z]*-[a-z]*-[a-z]*/[a-z]*-[a-z]*-[a-z]*.html#@"link" href="#@g
> +s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/bitbake-user-manual/bitbake-user-manual.html#@"link" href="#@g
>  
>  # Processes all other manuals (<word>-<word> style).
>  # This style is for manual folders that use two word, which is the standard now (e.g. "ref-manual").
>  # Here is the one-liner:
> -# s@"ulink" href="http://www.yoctoproject.org/docs/3.1/[a-z]*-[a-z]*/[a-z]*-[a-z]*.html#@"link" href="#@g
> +# s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/[a-z]*-[a-z]*/[a-z]*-[a-z]*.html#@"link" href="#@g
>  
> -s@"ulink" href="http://www.yoctoproject.org/docs/3.1/sdk-manual/sdk-manual.html#@"link" href="#@g
> -s@"ulink" href="http://www.yoctoproject.org/docs/3.1/bsp-guide/bsp-guide.html#@"link" href="#@g
> -s@"ulink" href="http://www.yoctoproject.org/docs/3.1/dev-manual/dev-manual.html#@"link" href="#@g
> -s@"ulink" href="http://www.yoctoproject.org/docs/3.1/overview-manual/overview-manual.html#@"link" href="#@g
> -s@"ulink" href="http://www.yoctoproject.org/docs/3.1/brief-yoctoprojectqs/brief-yoctoprojectqs.html#@"link" href="#@g
> -s@"ulink" href="http://www.yoctoproject.org/docs/3.1/kernel-dev/kernel-dev.html#@"link" href="#@g
> -s@"ulink" href="http://www.yoctoproject.org/docs/3.1/profile-manual/profile-manual.html#@"link" href="#@g
> -s@"ulink" href="http://www.yoctoproject.org/docs/3.1/ref-manual/ref-manual.html#@"link" href="#@g
> -s@"ulink" href="http://www.yoctoproject.org/docs/3.1/toaster-manual/toaster-manual.html#@"link" href="#@g
> +s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/sdk-manual/sdk-manual.html#@"link" href="#@g
> +s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/bsp-guide/bsp-guide.html#@"link" href="#@g
> +s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/dev-manual/dev-manual.html#@"link" href="#@g
> +s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/overview-manual/overview-manual.html#@"link" href="#@g
> +s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/brief-yoctoprojectqs/brief-yoctoprojectqs.html#@"link" href="#@g
> +s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/kernel-dev/kernel-dev.html#@"link" href="#@g
> +s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/profile-manual/profile-manual.html#@"link" href="#@g
> +s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/ref-manual/ref-manual.html#@"link" href="#@g
> +s@"ulink" href="http://www.yoctoproject.org/docs/3.1.1/toaster-manual/toaster-manual.html#@"link" href="#@g
>  
>  # Process cases where just an external manual is referenced without an id anchor
> -s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1/brief-yoctoprojectqs/brief-yoctoprojectqs.html" target="_top">Yocto Project Quick Build</a>@Yocto Project Quick Build@g
> -s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1/bitbake-user-manual/bitbake-user-manual.html" target="_top">BitBake User Manual</a>@BitBake User Manual@g
> -s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1/dev-manual/dev-manual.html" target="_top">Yocto Project Development Tasks Manual</a>@Yocto Project Development Tasks Manual@g
> -s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1/overview-manual/overview-manual.html" target="_top">Yocto Project Overview and Concepts Manual</a>@Yocto project Overview and Concepts Manual@g
> -s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1/sdk-manual/sdk-manual.html" target="_top">Yocto Project Application Development and the Extensible Software Development Kit (eSDK)</a>@Yocto Project Application Development and the Extensible Software Development Kit (eSDK)@g
> -s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1/bsp-guide/bsp-guide.html" target="_top">Yocto Project Board Support Package (BSP) Developer's Guide</a>@Yocto Project Board Support Package (BSP) Developer's Guide@g
> -s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1/profile-manual/profile-manual.html" target="_top">Yocto Project Profiling and Tracing Manual</a>@Yocto Project Profiling and Tracing Manual@g
> -s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1/kernel-dev/kernel-dev.html" target="_top">Yocto Project Linux Kernel Development Manual</a>@Yocto Project Linux Kernel Development Manual@g
> -s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1/ref-manual/ref-manual.html" target="_top">Yocto Project Reference Manual</a>@Yocto Project Reference Manual@g
> -s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1/toaster-manual/toaster-manual.html" target="_top">Toaster User Manual</a>@Toaster User Manual@g
> +s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/brief-yoctoprojectqs/brief-yoctoprojectqs.html" target="_top">Yocto Project Quick Build</a>@Yocto Project Quick Build@g
> +s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/bitbake-user-manual/bitbake-user-manual.html" target="_top">BitBake User Manual</a>@BitBake User Manual@g
> +s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/dev-manual/dev-manual.html" target="_top">Yocto Project Development Tasks Manual</a>@Yocto Project Development Tasks Manual@g
> +s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/overview-manual/overview-manual.html" target="_top">Yocto Project Overview and Concepts Manual</a>@Yocto project Overview and Concepts Manual@g
> +s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/sdk-manual/sdk-manual.html" target="_top">Yocto Project Application Development and the Extensible Software Development Kit (eSDK)</a>@Yocto Project Application Development and the Extensible Software Development Kit (eSDK)@g
> +s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/bsp-guide/bsp-guide.html" target="_top">Yocto Project Board Support Package (BSP) Developer's Guide</a>@Yocto Project Board Support Package (BSP) Developer's Guide@g
> +s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/profile-manual/profile-manual.html" target="_top">Yocto Project Profiling and Tracing Manual</a>@Yocto Project Profiling and Tracing Manual@g
> +s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/kernel-dev/kernel-dev.html" target="_top">Yocto Project Linux Kernel Development Manual</a>@Yocto Project Linux Kernel Development Manual@g
> +s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/ref-manual/ref-manual.html" target="_top">Yocto Project Reference Manual</a>@Yocto Project Reference Manual@g
> +s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/toaster-manual/toaster-manual.html" target="_top">Toaster User Manual</a>@Toaster User Manual@g
>  
>  # Process a single, rouge occurrence of a linked reference to the Mega-Manual.
> -s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1/mega-manual/mega-manual.html" target="_top">Yocto Project Mega-Manual</a>@Yocto Project Mega-Manual@g
> +s@<a class="ulink" href="http://www.yoctoproject.org/docs/3.1.1/mega-manual/mega-manual.html" target="_top">Yocto Project Mega-Manual</a>@Yocto Project Mega-Manual@g
>  
>
> 


--------------67C90B99143473B75F9E0791
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    I think you are missing some updates, please check these files:<br>
    <br>
    ./kernel-dev/kernel-dev.xml<br>
    ./ref-manual/ref-manual.xml<br>
    ./sdk-manual/sdk-manual.xml<br>
    ./overview-manual/overview-manual.xml<br>
    <br>
    - armin<br>
    <br>
    <div class="moz-cite-prefix">On 6/1/20 5:28 PM, Steve Sakoman wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:069c27574bf7333cdf58d9920734bb33c81ecc93.1591057623.git.steve@sakoman.com">
      <pre class="moz-quote-pre" wrap="">---
 documentation/bsp-guide/bsp-guide.xml         |  7 ++-
 documentation/dev-manual/dev-manual.xml       |  7 ++-
 documentation/mega-manual/mega-manual.xml     |  7 ++-
 documentation/poky.ent                        | 14 +++---
 .../profile-manual/profile-manual.xml         |  7 ++-
 .../toaster-manual/toaster-manual.xml         |  7 ++-
 documentation/tools/mega-manual.sed           | 46 +++++++++----------
 7 files changed, 60 insertions(+), 35 deletions(-)

diff --git a/documentation/bsp-guide/bsp-guide.xml b/documentation/bsp-guide/bsp-guide.xml
index a189606ce..6ab89d653 100755
--- a/documentation/bsp-guide/bsp-guide.xml
+++ b/documentation/bsp-guide/bsp-guide.xml
@@ -127,9 +127,14 @@
             &lt;/revision&gt;
             &lt;revision&gt;
                 &lt;revnumber&gt;3.1&lt;/revnumber&gt;
-                &lt;date&gt;&amp;REL_MONTH_YEAR;&lt;/date&gt;
+                &lt;date&gt;April 2020&lt;/date&gt;
                 &lt;revremark&gt;Released with the Yocto Project 3.1 Release.&lt;/revremark&gt;
             &lt;/revision&gt;
+            &lt;revision&gt;
+                &lt;revnumber&gt;3.1.1&lt;/revnumber&gt;
+                &lt;date&gt;&amp;REL_MONTH_YEAR;&lt;/date&gt;
+                &lt;revremark&gt;Released with the Yocto Project 3.1.1 Release.&lt;/revremark&gt;
+            &lt;/revision&gt;
         &lt;/revhistory&gt;
 
     &lt;copyright&gt;
diff --git a/documentation/dev-manual/dev-manual.xml b/documentation/dev-manual/dev-manual.xml
index 6f86454ed..5c6b3457f 100755
--- a/documentation/dev-manual/dev-manual.xml
+++ b/documentation/dev-manual/dev-manual.xml
@@ -117,9 +117,14 @@
             &lt;/revision&gt;
             &lt;revision&gt;
                 &lt;revnumber&gt;3.1&lt;/revnumber&gt;
-                &lt;date&gt;&amp;REL_MONTH_YEAR;&lt;/date&gt;
+                &lt;date&gt;April 2020&lt;/date&gt;
                 &lt;revremark&gt;Released with the Yocto Project 3.1 Release.&lt;/revremark&gt;
             &lt;/revision&gt;
+            &lt;revision&gt;
+                &lt;revnumber&gt;3.1.1&lt;/revnumber&gt;
+                &lt;date&gt;&amp;REL_MONTH_YEAR;&lt;/date&gt;
+                &lt;revremark&gt;Released with the Yocto Project 3.1.1 Release.&lt;/revremark&gt;
+            &lt;/revision&gt;
         &lt;/revhistory&gt;
 
     &lt;copyright&gt;
diff --git a/documentation/mega-manual/mega-manual.xml b/documentation/mega-manual/mega-manual.xml
index e730f7259..a20843fc1 100755
--- a/documentation/mega-manual/mega-manual.xml
+++ b/documentation/mega-manual/mega-manual.xml
@@ -93,9 +93,14 @@
             &lt;/revision&gt;
             &lt;revision&gt;
                 &lt;revnumber&gt;3.1&lt;/revnumber&gt;
-                &lt;date&gt;&amp;REL_MONTH_YEAR;&lt;/date&gt;
+                &lt;date&gt;April 2020&lt;/date&gt;
                 &lt;revremark&gt;Released with the Yocto Project 3.1 Release.&lt;/revremark&gt;
             &lt;/revision&gt;
+            &lt;revision&gt;
+                &lt;revnumber&gt;3.1.1&lt;/revnumber&gt;
+                &lt;date&gt;&amp;REL_MONTH_YEAR;&lt;/date&gt;
+                &lt;revremark&gt;Released with the Yocto Project 3.1.1 Release.&lt;/revremark&gt;
+            &lt;/revision&gt;
        &lt;/revhistory&gt;
 
     &lt;copyright&gt;
diff --git a/documentation/poky.ent b/documentation/poky.ent
index a54793911..0a0deab8f 100755
--- a/documentation/poky.ent
+++ b/documentation/poky.ent
@@ -1,17 +1,17 @@
-&lt;!ENTITY DISTRO "3.1"&gt;
-&lt;!ENTITY DISTRO_COMPRESSED "31"&gt;
+&lt;!ENTITY DISTRO "3.1.1"&gt;
+&lt;!ENTITY DISTRO_COMPRESSED "311"&gt;
 &lt;!ENTITY DISTRO_NAME_NO_CAP "dunfell"&gt;
 &lt;!ENTITY DISTRO_NAME "Dunfell"&gt;
 &lt;!ENTITY DISTRO_NAME_NO_CAP_MINUS_ONE "zeus"&gt;
 &lt;!ENTITY DISTRO_NAME_MINUS_ONE "Zeus"&gt;
-&lt;!ENTITY YOCTO_DOC_VERSION "3.1"&gt;
+&lt;!ENTITY YOCTO_DOC_VERSION "3.1.1"&gt;
 &lt;!ENTITY YOCTO_DOC_VERSION_MINUS_ONE "3.0.2"&gt;
-&lt;!ENTITY DISTRO_REL_TAG "yocto-3.1"&gt;
+&lt;!ENTITY DISTRO_REL_TAG "yocto-3.1.1"&gt;
 &lt;!ENTITY METAINTELVERSION "12.0"&gt;
-&lt;!ENTITY REL_MONTH_YEAR "April 2020"&gt;
+&lt;!ENTITY REL_MONTH_YEAR "June 2020"&gt;
 &lt;!ENTITY META_INTEL_REL_TAG "&amp;METAINTELVERSION;-&amp;DISTRO_NAME_NO_CAP;-&amp;YOCTO_DOC_VERSION;"&gt;
-&lt;!ENTITY POKYVERSION "23.0.0"&gt;
-&lt;!ENTITY POKYVERSION_COMPRESSED "2300"&gt;
+&lt;!ENTITY POKYVERSION "23.0.1"&gt;
+&lt;!ENTITY POKYVERSION_COMPRESSED "2301"&gt;
 &lt;!ENTITY YOCTO_POKY "poky-&amp;DISTRO_NAME_NO_CAP;-&amp;POKYVERSION;"&gt;
 &lt;!ENTITY COPYRIGHT_YEAR "2010-2020"&gt;
 &lt;!ENTITY ORGNAME "The Yocto Project"&gt;
diff --git a/documentation/profile-manual/profile-manual.xml b/documentation/profile-manual/profile-manual.xml
index fa1fa8ac8..710fb770e 100755
--- a/documentation/profile-manual/profile-manual.xml
+++ b/documentation/profile-manual/profile-manual.xml
@@ -102,9 +102,14 @@
             &lt;/revision&gt;
             &lt;revision&gt;
                 &lt;revnumber&gt;3.1&lt;/revnumber&gt;
-                &lt;date&gt;&amp;REL_MONTH_YEAR;&lt;/date&gt;
+                &lt;date&gt;April 2020&lt;/date&gt;
                 &lt;revremark&gt;Released with the Yocto Project 3.1 Release.&lt;/revremark&gt;
             &lt;/revision&gt;
+            &lt;revision&gt;
+                &lt;revnumber&gt;3.1.1&lt;/revnumber&gt;
+                &lt;date&gt;&amp;REL_MONTH_YEAR;&lt;/date&gt;
+                &lt;revremark&gt;Released with the Yocto Project 3.1.1 Release.&lt;/revremark&gt;
+            &lt;/revision&gt;
         &lt;/revhistory&gt;
 
     &lt;copyright&gt;
diff --git a/documentation/toaster-manual/toaster-manual.xml b/documentation/toaster-manual/toaster-manual.xml
index e6d424523..53d666446 100755
--- a/documentation/toaster-manual/toaster-manual.xml
+++ b/documentation/toaster-manual/toaster-manual.xml
@@ -82,9 +82,14 @@
             &lt;/revision&gt;
             &lt;revision&gt;
                 &lt;revnumber&gt;3.1&lt;/revnumber&gt;
-                &lt;date&gt;&amp;REL_MONTH_YEAR;&lt;/date&gt;
+                &lt;date&gt;April 2020&lt;/date&gt;
                 &lt;revremark&gt;Released with the Yocto Project 3.1 Release.&lt;/revremark&gt;
             &lt;/revision&gt;
+            &lt;revision&gt;
+                &lt;revnumber&gt;3.1.1&lt;/revnumber&gt;
+                &lt;date&gt;&amp;REL_MONTH_YEAR;&lt;/date&gt;
+                &lt;revremark&gt;Released with the Yocto Project 3.1.1 Release.&lt;/revremark&gt;
+            &lt;/revision&gt;
        &lt;/revhistory&gt;
 
     &lt;copyright&gt;
diff --git a/documentation/tools/mega-manual.sed b/documentation/tools/mega-manual.sed
index b1ea9edb7..d52f1ebdb 100644
--- a/documentation/tools/mega-manual.sed
+++ b/documentation/tools/mega-manual.sed
@@ -1,36 +1,36 @@
 # Processes bitbake-user-manual (&lt;word&gt;-&lt;word&gt;-&lt;word&gt; style).
 # This style is for manual three-word folders, which currently is only the BitBake User Manual.
 # We used to have the "yocto-project-qs" and "poky-ref-manual" folders but no longer do.
-# s@"ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1/[a-z]*-[a-z]*-[a-z]*/[a-z]*-[a-z]*-[a-z]*.html#@">"http://www.yoctoproject.org/docs/3.1/[a-z]*-[a-z]*-[a-z]*/[a-z]*-[a-z]*-[a-z]*.html#@"</a>link" href="#@g
-s@"ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1/bitbake-user-manual/bitbake-user-manual.html#@">"http://www.yoctoproject.org/docs/3.1/bitbake-user-manual/bitbake-user-manual.html#@"</a>link" href="#@g
+# s@"ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1.1/[a-z]*-[a-z]*-[a-z]*/[a-z]*-[a-z]*-[a-z]*.html#@">"http://www.yoctoproject.org/docs/3.1.1/[a-z]*-[a-z]*-[a-z]*/[a-z]*-[a-z]*-[a-z]*.html#@"</a>link" href="#@g
+s@"ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1.1/bitbake-user-manual/bitbake-user-manual.html#@">"http://www.yoctoproject.org/docs/3.1.1/bitbake-user-manual/bitbake-user-manual.html#@"</a>link" href="#@g
 
 # Processes all other manuals (&lt;word&gt;-&lt;word&gt; style).
 # This style is for manual folders that use two word, which is the standard now (e.g. "ref-manual").
 # Here is the one-liner:
-# s@"ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1/[a-z]*-[a-z]*/[a-z]*-[a-z]*.html#@">"http://www.yoctoproject.org/docs/3.1/[a-z]*-[a-z]*/[a-z]*-[a-z]*.html#@"</a>link" href="#@g
+# s@"ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1.1/[a-z]*-[a-z]*/[a-z]*-[a-z]*.html#@">"http://www.yoctoproject.org/docs/3.1.1/[a-z]*-[a-z]*/[a-z]*-[a-z]*.html#@"</a>link" href="#@g
 
-s@"ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1/sdk-manual/sdk-manual.html#@">"http://www.yoctoproject.org/docs/3.1/sdk-manual/sdk-manual.html#@"</a>link" href="#@g
-s@"ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1/bsp-guide/bsp-guide.html#@">"http://www.yoctoproject.org/docs/3.1/bsp-guide/bsp-guide.html#@"</a>link" href="#@g
-s@"ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1/dev-manual/dev-manual.html#@">"http://www.yoctoproject.org/docs/3.1/dev-manual/dev-manual.html#@"</a>link" href="#@g
-s@"ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1/overview-manual/overview-manual.html#@">"http://www.yoctoproject.org/docs/3.1/overview-manual/overview-manual.html#@"</a>link" href="#@g
-s@"ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1/brief-yoctoprojectqs/brief-yoctoprojectqs.html#@">"http://www.yoctoproject.org/docs/3.1/brief-yoctoprojectqs/brief-yoctoprojectqs.html#@"</a>link" href="#@g
-s@"ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1/kernel-dev/kernel-dev.html#@">"http://www.yoctoproject.org/docs/3.1/kernel-dev/kernel-dev.html#@"</a>link" href="#@g
-s@"ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1/profile-manual/profile-manual.html#@">"http://www.yoctoproject.org/docs/3.1/profile-manual/profile-manual.html#@"</a>link" href="#@g
-s@"ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1/ref-manual/ref-manual.html#@">"http://www.yoctoproject.org/docs/3.1/ref-manual/ref-manual.html#@"</a>link" href="#@g
-s@"ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1/toaster-manual/toaster-manual.html#@">"http://www.yoctoproject.org/docs/3.1/toaster-manual/toaster-manual.html#@"</a>link" href="#@g
+s@"ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1.1/sdk-manual/sdk-manual.html#@">"http://www.yoctoproject.org/docs/3.1.1/sdk-manual/sdk-manual.html#@"</a>link" href="#@g
+s@"ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1.1/bsp-guide/bsp-guide.html#@">"http://www.yoctoproject.org/docs/3.1.1/bsp-guide/bsp-guide.html#@"</a>link" href="#@g
+s@"ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1.1/dev-manual/dev-manual.html#@">"http://www.yoctoproject.org/docs/3.1.1/dev-manual/dev-manual.html#@"</a>link" href="#@g
+s@"ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1.1/overview-manual/overview-manual.html#@">"http://www.yoctoproject.org/docs/3.1.1/overview-manual/overview-manual.html#@"</a>link" href="#@g
+s@"ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1.1/brief-yoctoprojectqs/brief-yoctoprojectqs.html#@">"http://www.yoctoproject.org/docs/3.1.1/brief-yoctoprojectqs/brief-yoctoprojectqs.html#@"</a>link" href="#@g
+s@"ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1.1/kernel-dev/kernel-dev.html#@">"http://www.yoctoproject.org/docs/3.1.1/kernel-dev/kernel-dev.html#@"</a>link" href="#@g
+s@"ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1.1/profile-manual/profile-manual.html#@">"http://www.yoctoproject.org/docs/3.1.1/profile-manual/profile-manual.html#@"</a>link" href="#@g
+s@"ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1.1/ref-manual/ref-manual.html#@">"http://www.yoctoproject.org/docs/3.1.1/ref-manual/ref-manual.html#@"</a>link" href="#@g
+s@"ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1.1/toaster-manual/toaster-manual.html#@">"http://www.yoctoproject.org/docs/3.1.1/toaster-manual/toaster-manual.html#@"</a>link" href="#@g
 
 # Process cases where just an external manual is referenced without an id anchor
-s@&lt;a class="ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1/brief-yoctoprojectqs/brief-yoctoprojectqs.html">"http://www.yoctoproject.org/docs/3.1/brief-yoctoprojectqs/brief-yoctoprojectqs.html"</a> target="_top"&gt;Yocto Project Quick Build&lt;/a&gt;@Yocto Project Quick Build@g
-s@&lt;a class="ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1/bitbake-user-manual/bitbake-user-manual.html">"http://www.yoctoproject.org/docs/3.1/bitbake-user-manual/bitbake-user-manual.html"</a> target="_top"&gt;BitBake User Manual&lt;/a&gt;@BitBake User Manual@g
-s@&lt;a class="ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1/dev-manual/dev-manual.html">"http://www.yoctoproject.org/docs/3.1/dev-manual/dev-manual.html"</a> target="_top"&gt;Yocto Project Development Tasks Manual&lt;/a&gt;@Yocto Project Development Tasks Manual@g
-s@&lt;a class="ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1/overview-manual/overview-manual.html">"http://www.yoctoproject.org/docs/3.1/overview-manual/overview-manual.html"</a> target="_top"&gt;Yocto Project Overview and Concepts Manual&lt;/a&gt;@Yocto project Overview and Concepts Manual@g
-s@&lt;a class="ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1/sdk-manual/sdk-manual.html">"http://www.yoctoproject.org/docs/3.1/sdk-manual/sdk-manual.html"</a> target="_top"&gt;Yocto Project Application Development and the Extensible Software Development Kit (eSDK)&lt;/a&gt;@Yocto Project Application Development and the Extensible Software Development Kit (eSDK)@g
-s@&lt;a class="ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1/bsp-guide/bsp-guide.html">"http://www.yoctoproject.org/docs/3.1/bsp-guide/bsp-guide.html"</a> target="_top"&gt;Yocto Project Board Support Package (BSP) Developer's Guide&lt;/a&gt;@Yocto Project Board Support Package (BSP) Developer's Guide@g
-s@&lt;a class="ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1/profile-manual/profile-manual.html">"http://www.yoctoproject.org/docs/3.1/profile-manual/profile-manual.html"</a> target="_top"&gt;Yocto Project Profiling and Tracing Manual&lt;/a&gt;@Yocto Project Profiling and Tracing Manual@g
-s@&lt;a class="ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1/kernel-dev/kernel-dev.html">"http://www.yoctoproject.org/docs/3.1/kernel-dev/kernel-dev.html"</a> target="_top"&gt;Yocto Project Linux Kernel Development Manual&lt;/a&gt;@Yocto Project Linux Kernel Development Manual@g
-s@&lt;a class="ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1/ref-manual/ref-manual.html">"http://www.yoctoproject.org/docs/3.1/ref-manual/ref-manual.html"</a> target="_top"&gt;Yocto Project Reference Manual&lt;/a&gt;@Yocto Project Reference Manual@g
-s@&lt;a class="ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1/toaster-manual/toaster-manual.html">"http://www.yoctoproject.org/docs/3.1/toaster-manual/toaster-manual.html"</a> target="_top"&gt;Toaster User Manual&lt;/a&gt;@Toaster User Manual@g
+s@&lt;a class="ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1.1/brief-yoctoprojectqs/brief-yoctoprojectqs.html">"http://www.yoctoproject.org/docs/3.1.1/brief-yoctoprojectqs/brief-yoctoprojectqs.html"</a> target="_top"&gt;Yocto Project Quick Build&lt;/a&gt;@Yocto Project Quick Build@g
+s@&lt;a class="ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1.1/bitbake-user-manual/bitbake-user-manual.html">"http://www.yoctoproject.org/docs/3.1.1/bitbake-user-manual/bitbake-user-manual.html"</a> target="_top"&gt;BitBake User Manual&lt;/a&gt;@BitBake User Manual@g
+s@&lt;a class="ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1.1/dev-manual/dev-manual.html">"http://www.yoctoproject.org/docs/3.1.1/dev-manual/dev-manual.html"</a> target="_top"&gt;Yocto Project Development Tasks Manual&lt;/a&gt;@Yocto Project Development Tasks Manual@g
+s@&lt;a class="ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1.1/overview-manual/overview-manual.html">"http://www.yoctoproject.org/docs/3.1.1/overview-manual/overview-manual.html"</a> target="_top"&gt;Yocto Project Overview and Concepts Manual&lt;/a&gt;@Yocto project Overview and Concepts Manual@g
+s@&lt;a class="ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1.1/sdk-manual/sdk-manual.html">"http://www.yoctoproject.org/docs/3.1.1/sdk-manual/sdk-manual.html"</a> target="_top"&gt;Yocto Project Application Development and the Extensible Software Development Kit (eSDK)&lt;/a&gt;@Yocto Project Application Development and the Extensible Software Development Kit (eSDK)@g
+s@&lt;a class="ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1.1/bsp-guide/bsp-guide.html">"http://www.yoctoproject.org/docs/3.1.1/bsp-guide/bsp-guide.html"</a> target="_top"&gt;Yocto Project Board Support Package (BSP) Developer's Guide&lt;/a&gt;@Yocto Project Board Support Package (BSP) Developer's Guide@g
+s@&lt;a class="ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1.1/profile-manual/profile-manual.html">"http://www.yoctoproject.org/docs/3.1.1/profile-manual/profile-manual.html"</a> target="_top"&gt;Yocto Project Profiling and Tracing Manual&lt;/a&gt;@Yocto Project Profiling and Tracing Manual@g
+s@&lt;a class="ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1.1/kernel-dev/kernel-dev.html">"http://www.yoctoproject.org/docs/3.1.1/kernel-dev/kernel-dev.html"</a> target="_top"&gt;Yocto Project Linux Kernel Development Manual&lt;/a&gt;@Yocto Project Linux Kernel Development Manual@g
+s@&lt;a class="ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1.1/ref-manual/ref-manual.html">"http://www.yoctoproject.org/docs/3.1.1/ref-manual/ref-manual.html"</a> target="_top"&gt;Yocto Project Reference Manual&lt;/a&gt;@Yocto Project Reference Manual@g
+s@&lt;a class="ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1.1/toaster-manual/toaster-manual.html">"http://www.yoctoproject.org/docs/3.1.1/toaster-manual/toaster-manual.html"</a> target="_top"&gt;Toaster User Manual&lt;/a&gt;@Toaster User Manual@g
 
 # Process a single, rouge occurrence of a linked reference to the Mega-Manual.
-s@&lt;a class="ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1/mega-manual/mega-manual.html">"http://www.yoctoproject.org/docs/3.1/mega-manual/mega-manual.html"</a> target="_top"&gt;Yocto Project Mega-Manual&lt;/a&gt;@Yocto Project Mega-Manual@g
+s@&lt;a class="ulink" href=<a class="moz-txt-link-rfc2396E" href="http://www.yoctoproject.org/docs/3.1.1/mega-manual/mega-manual.html">"http://www.yoctoproject.org/docs/3.1.1/mega-manual/mega-manual.html"</a> target="_top"&gt;Yocto Project Mega-Manual&lt;/a&gt;@Yocto Project Mega-Manual@g
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------67C90B99143473B75F9E0791--
