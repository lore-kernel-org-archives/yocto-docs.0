Received: from mail-oo1-f68.google.com (mail-oo1-f68.google.com [209.85.161.68])
 by mx.groups.io with SMTP id smtpd.web11.561.1594938903827119477
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Jul 2020 15:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MarDbr0c;
 spf=pass (domain: gmail.com, ip: 209.85.161.68, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f68.google.com with SMTP id t6so1497631ooh.4
        for <docs@lists.yoctoproject.org>; Thu, 16 Jul 2020 15:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=2N0dTIo/e9k5Wij2idrDJUnFKiODVoELWGNKOG1TvAQ=;
        b=MarDbr0cwLPOVad5s2xmkyxS5dtIOn8Gopbvm20tbCH2YEgH5oz+7NgF28oBwxKmn+
         Tjn32a1hzBMV8LQRURcpTCpFLoqdJNih3cZhPBPoe/aqn2FWWQ7ln2SXde7nCM8MQg2I
         NJ3/RuH5QgFeTkXtcwVWx7uL7CyQWPiuP44dVElirJunjJ1K2n7AUhbFWgQ3W5GHjudi
         ZwUYwv5vkMnPHowqTnCPzjzwLEBT7bmPhsJ5k8c6M14sja4oFWOUWSes7X9a/rXtVn9Q
         z9ZvT0vfIvadkUkLrhDFtKww+q62YCNHkOYFerwF0UxJsGvtd79R1EoIoknA+3bHO4bX
         /DVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=2N0dTIo/e9k5Wij2idrDJUnFKiODVoELWGNKOG1TvAQ=;
        b=HzLMJzvai5zr+PbPIVILFPK5g7N5HPVsJrlF29IZej8kbXSiaXKeqf2qrIVSn3PJnk
         6kEFIAgHlM7F/UMCuXAQ24rMFOHTZuTstIu2bNCegaFMUG97120BQlpgO0uPqx5bim5T
         FntdYf7JLvKBQdQOdWg4EHR/kApFlfAM8qRkyVWGU2NaCMyo8NB2FbZddvghRsob3VC+
         x04V/6ea3PUwE2EZmwLx4s2C4uohmlMFrs6AaylmCuskJhm+seE2vJFO2jEJLf1qsJXw
         bQ9aqAt11ihqCiVDyUr5RitGgQs7+U3LcFTKnrkDhxaAhSHBuB7CJ/jTbeC0SlP/M1lW
         ZsHw==
X-Gm-Message-State: AOAM530rOAzDW4KQnAPIovKMIKQumPTpvoyZCTQJbzo6+0KEzNSXagm4
	mojUv72AKvyD5gH7732HdL2ROMzHuVY=
X-Google-Smtp-Source: ABdhPJzg2TgM+774zPeLqtF8XRDNMnU/Ziw118jKCz+E6prdtJsNiKWJHe7JpTKigcwuIxAr7/vQOw==
X-Received: by 2002:a4a:d74d:: with SMTP id h13mr6228667oot.56.1594938903016;
        Thu, 16 Jul 2020 15:35:03 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:7df4:7f73:717d:af68? ([2601:202:4180:a5c0:7df4:7f73:717d:af68])
        by smtp.gmail.com with ESMTPSA id l18sm1572185ooe.32.2020.07.16.15.35.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2020 15:35:02 -0700 (PDT)
Subject: Re: [docs] [PATCH] ref-system-requirements: update supported hosts lists
To: docs@lists.yoctoproject.org
References: <16225C0CF546C9E0.31624@lists.yoctoproject.org>
Cc: Steve Sakoman <steve@sakoman.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <776527fe-3306-c772-103d-5632b4475809@gmail.com>
Date: Thu, 16 Jul 2020 15:35:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <16225C0CF546C9E0.31624@lists.yoctoproject.org>
Content-Type: multipart/alternative;
 boundary="------------839F7245540C70E6E59A0A04"
Content-Language: en-US

--------------839F7245540C70E6E59A0A04
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Dunfell needs updating too but I am not sure if we can remove hosts that
are no longer in the AB like Ubuntu 19.04 or the Fedora ones.

- armin

On 7/16/20 3:27 PM, akuster via lists.yoctoproject.org wrote:
> drop Ubuntu 19, Fedora 28 & 29
> Add: Fedora 31, 32 , Centos 8 and Ubuntu 20
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  documentation/ref-manual/ref-system-requirements.xml | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/documentation/ref-manual/ref-system-requirements.xml b/documentation/ref-manual/ref-system-requirements.xml
> index 43e217c6d..ac8b0032d 100644
> --- a/documentation/ref-manual/ref-system-requirements.xml
> +++ b/documentation/ref-manual/ref-system-requirements.xml
> @@ -94,11 +94,12 @@
>              <itemizedlist>
>                  <listitem><para>Ubuntu 16.04 (LTS)</para></listitem>
>                  <listitem><para>Ubuntu 18.04 (LTS)</para></listitem>
> -                <listitem><para>Ubuntu 19.04</para></listitem>
> -                <listitem><para>Fedora 28</para></listitem>
> -                <listitem><para>Fedora 29</para></listitem>
> +                <listitem><para>Ubuntu 20.04</para></listitem>
>                  <listitem><para>Fedora 30</para></listitem>
> +                <listitem><para>Fedora 31</para></listitem>
> +                <listitem><para>Fedora 32</para></listitem>
>                  <listitem><para>CentOS 7.x</para></listitem>
> +                <listitem><para>CentOS 8.x</para></listitem>
>                  <listitem><para>Debian GNU/Linux 8.x (Jessie)</para></listitem>
>                  <listitem><para>Debian GNU/Linux 9.x (Stretch)</para></listitem>
>                  <listitem><para>Debian GNU/Linux 10.x (Buster)</para></listitem>
>
> 


--------------839F7245540C70E6E59A0A04
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Dunfell needs updating too but I am not sure if we can remove hosts
    that are no longer in the AB like Ubuntu 19.04 or the Fedora ones.<br>
    <br>
    - armin<br>
    <br>
    <div class="moz-cite-prefix">On 7/16/20 3:27 PM, akuster via
      lists.yoctoproject.org wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:16225C0CF546C9E0.31624@lists.yoctoproject.org">
      <pre class="moz-quote-pre" wrap="">drop Ubuntu 19, Fedora 28 &amp; 29
Add: Fedora 31, 32 , Centos 8 and Ubuntu 20

Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a>
---
 documentation/ref-manual/ref-system-requirements.xml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/ref-system-requirements.xml b/documentation/ref-manual/ref-system-requirements.xml
index 43e217c6d..ac8b0032d 100644
--- a/documentation/ref-manual/ref-system-requirements.xml
+++ b/documentation/ref-manual/ref-system-requirements.xml
@@ -94,11 +94,12 @@
             &lt;itemizedlist&gt;
                 &lt;listitem&gt;&lt;para&gt;Ubuntu 16.04 (LTS)&lt;/para&gt;&lt;/listitem&gt;
                 &lt;listitem&gt;&lt;para&gt;Ubuntu 18.04 (LTS)&lt;/para&gt;&lt;/listitem&gt;
-                &lt;listitem&gt;&lt;para&gt;Ubuntu 19.04&lt;/para&gt;&lt;/listitem&gt;
-                &lt;listitem&gt;&lt;para&gt;Fedora 28&lt;/para&gt;&lt;/listitem&gt;
-                &lt;listitem&gt;&lt;para&gt;Fedora 29&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;Ubuntu 20.04&lt;/para&gt;&lt;/listitem&gt;
                 &lt;listitem&gt;&lt;para&gt;Fedora 30&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;Fedora 31&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;Fedora 32&lt;/para&gt;&lt;/listitem&gt;
                 &lt;listitem&gt;&lt;para&gt;CentOS 7.x&lt;/para&gt;&lt;/listitem&gt;
+                &lt;listitem&gt;&lt;para&gt;CentOS 8.x&lt;/para&gt;&lt;/listitem&gt;
                 &lt;listitem&gt;&lt;para&gt;Debian GNU/Linux 8.x (Jessie)&lt;/para&gt;&lt;/listitem&gt;
                 &lt;listitem&gt;&lt;para&gt;Debian GNU/Linux 9.x (Stretch)&lt;/para&gt;&lt;/listitem&gt;
                 &lt;listitem&gt;&lt;para&gt;Debian GNU/Linux 10.x (Buster)&lt;/para&gt;&lt;/listitem&gt;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------839F7245540C70E6E59A0A04--
