Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web12.12707.1585421610663946467
 for <docs@lists.yoctoproject.org>;
 Sat, 28 Mar 2020 11:53:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WPYiTTLv;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id jz1so5255934pjb.0
        for <docs@lists.yoctoproject.org>; Sat, 28 Mar 2020 11:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=HTxUjpTecQPEK6mi5rvRek1NnVVx12dzicag64Nw7xk=;
        b=WPYiTTLv1YdGYojmiw+QsGcmExXhv3rMpMTHt2LGDmevKR3ZZI2aDhIGH8BQYtJ6TD
         dCeMWg2fiCZdrKuOiH+P6TwRjc4DiZaYH51H0jLsgsVDe1tajtaRhGoI1j6kgzXyAqeY
         rG6oBh9v4PvkdsSD6amOgr0MbIZRx2HskU6XWRVmogYN/LgE7dBOxWaPyuQmDJ17y1M7
         EVAH4vTNxDW4kJfpmQ3t3hHY5/3EeNhcD9Ldu/+4S3JvLSA9l5s5v1ghC6gRVT2lFSYK
         cDsufbDCF4uWYKtOa10UfJMdFOAYjhPvfMu4tFiQ3piUoDcuouJzBHqqHWD48gg8ODcg
         OJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=HTxUjpTecQPEK6mi5rvRek1NnVVx12dzicag64Nw7xk=;
        b=RF9X6UNfYbOCCWXSznlvTkXfP143AgbKmGza93IbSwhR17zGwe+MG9npy7uIBjd0hg
         Zd8nrEqBo9eq7oQYjoSkZSwkDRP61pavaQowxY4umlRgkZk3ecdbP4sgVvATUrnIeIjE
         E/Ce9dWGnMtbjsRTI9d652xIXQZ3MwdeTpwBG7MEeoBQJWgWcPRybkHs1tWoXUBsGetY
         wf2q/1Gk6bbe1ORgsKYWSF1f6sgMzt6BpkG7dyeuRVzgwHN8oigzzdxDtr1MNgxKMJDO
         G5UPAtSQLWemJVetAxo+yBGMFFqHgMHIclFk6q9qC5b3wRtcAslWVi2uj4lIHzlYjIxz
         YzNA==
X-Gm-Message-State: ANhLgQ1N8oc8YQyqQZx4oY2Lzxz9/nNGlvNsJKZjDQx3lqyacCH248U+
	JGAXxk6zzKZN3uE5Kr+R0Ic=
X-Google-Smtp-Source: ADFU+vvTelb1XUw6BBLj98nAXXiAtzo12N2oqqHbck1T3sBHTSIiLayN7i9ZmdN6HCxfMaPF+G3juw==
X-Received: by 2002:a17:90a:1acf:: with SMTP id p73mr6278015pjp.53.1585421610217;
        Sat, 28 Mar 2020 11:53:30 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:7d86:c1cf:b059:97c0? ([2601:202:4180:a5c0:7d86:c1cf:b059:97c0])
        by smtp.gmail.com with ESMTPSA id p1sm4534410pjr.40.2020.03.28.11.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Mar 2020 11:53:29 -0700 (PDT)
Subject: Re: [docs] [PATCH 1/3] dev-manual: Fix CROPS link
To: docs@lists.yoctoproject.org
Cc: richard.purdie@linuxfoundation.org
References: <20200328092106.28231-1-alhe@linux.microsoft.com>
 <20200328092106.28231-2-alhe@linux.microsoft.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <3d99e73d-4ece-ab8b-f035-804759097951@gmail.com>
Date: Sat, 28 Mar 2020 11:53:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200328092106.28231-2-alhe@linux.microsoft.com>
Content-Type: multipart/alternative;
 boundary="------------A50357682A6D26AE5EE71C4C"
Content-Language: en-US

--------------A50357682A6D26AE5EE71C4C
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 3/28/20 2:21 AM, alhe@linux.microsoft.com wrote:
> The link used in the documentation points to a file
> that no longer exists on the crops repository.
>
> Use the poky-container repo instead since it is more
> accurate and updated
>
> Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
> Signed-off-by: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
> ---
>  documentation/dev-manual/dev-manual-start.xml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/dev-manual/dev-manual-start.xml b/documentation/dev-manual/dev-manual-start.xml
> index 59ffa49bb6..8d2f316f52 100644
> --- a/documentation/dev-manual/dev-manual-start.xml
> +++ b/documentation/dev-manual/dev-manual-start.xml
> @@ -396,7 +396,7 @@
>          for development using the Yocto Project.
>          Your build host can be a native Linux machine (recommended) or it can
>          be a machine (Linux, Mac, or Windows) that uses
> -        <ulink url='https://git.yoctoproject.org/cgit/cgit.cgi/crops/about/'>CROPS</ulink>,
> +        <ulink url='https://github.com/crops/poky-container'>CROPS</ulink>,

So what is "https://git.yoctoproject.org/git/crops"
<https://git.yoctoproject.org/git/crops>

used for then. If its wrong, we should either link it or remove that
repo from YP git.

- armin
<https://git.yoctoproject.org/git/crops>
>          which leverages
>          <ulink url='https://www.docker.com/'>Docker Containers</ulink>.
>          <note>
> @@ -517,7 +517,7 @@
>  
>          <para>
>              With
> -            <ulink url='https://github.com/crops/crops/blob/master/README.md'>CROPS</ulink>,
> +            <ulink url='https://github.com/crops/poky-container'>CROPS</ulink>,
>              which leverages
>              <ulink url='https://www.docker.com/'>Docker Containers</ulink>,
>              you can create a Yocto Project development environment that
>
> 


--------------A50357682A6D26AE5EE71C4C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 3/28/20 2:21 AM,
      <a class="moz-txt-link-abbreviated" href="mailto:alhe@linux.microsoft.com">alhe@linux.microsoft.com</a> wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200328092106.28231-2-alhe@linux.microsoft.com">
      <pre class="moz-quote-pre" wrap="">The link used in the documentation points to a file
that no longer exists on the crops repository.

Use the poky-container repo instead since it is more
accurate and updated

Signed-off-by: Alejandro Hernandez Samaniego <a class="moz-txt-link-rfc2396E" href="mailto:alejandro@enedino.org">&lt;alejandro@enedino.org&gt;</a>
Signed-off-by: Alejandro Hernandez Samaniego <a class="moz-txt-link-rfc2396E" href="mailto:alhe@linux.microsoft.com">&lt;alhe@linux.microsoft.com&gt;</a>
---
 documentation/dev-manual/dev-manual-start.xml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-start.xml b/documentation/dev-manual/dev-manual-start.xml
index 59ffa49bb6..8d2f316f52 100644
--- a/documentation/dev-manual/dev-manual-start.xml
+++ b/documentation/dev-manual/dev-manual-start.xml
@@ -396,7 +396,7 @@
         for development using the Yocto Project.
         Your build host can be a native Linux machine (recommended) or it can
         be a machine (Linux, Mac, or Windows) that uses
-        &lt;ulink url='<a class="moz-txt-link-freetext" href="https://git.yoctoproject.org/cgit/cgit.cgi/crops/about/">https://git.yoctoproject.org/cgit/cgit.cgi/crops/about/</a>'&gt;CROPS&lt;/ulink&gt;,
+        &lt;ulink url='<a class="moz-txt-link-freetext" href="https://github.com/crops/poky-container">https://github.com/crops/poky-container</a>'&gt;CROPS&lt;/ulink&gt;,</pre>
    </blockquote>
    <br>
    So what is "<a rel="vcs-git"
      href="https://git.yoctoproject.org/git/crops" title="crops Git
      repository">https://git.yoctoproject.org/git/crops" </a><br>
    <br>
    used for then. If its wrong, we should either link it or remove that
    repo from YP git.<br>
    <br>
    - armin<br>
    <a rel="vcs-git" href="https://git.yoctoproject.org/git/crops"
      title="crops Git repository"></a>
    <blockquote type="cite"
      cite="mid:20200328092106.28231-2-alhe@linux.microsoft.com">
      <pre class="moz-quote-pre" wrap="">
         which leverages
         &lt;ulink url='<a class="moz-txt-link-freetext" href="https://www.docker.com/">https://www.docker.com/</a>'&gt;Docker Containers&lt;/ulink&gt;.
         &lt;note&gt;
@@ -517,7 +517,7 @@
 
         &lt;para&gt;
             With
-            &lt;ulink url='<a class="moz-txt-link-freetext" href="https://github.com/crops/crops/blob/master/README.md">https://github.com/crops/crops/blob/master/README.md</a>'&gt;CROPS&lt;/ulink&gt;,
+            &lt;ulink url='<a class="moz-txt-link-freetext" href="https://github.com/crops/poky-container">https://github.com/crops/poky-container</a>'&gt;CROPS&lt;/ulink&gt;,
             which leverages
             &lt;ulink url='<a class="moz-txt-link-freetext" href="https://www.docker.com/">https://www.docker.com/</a>'&gt;Docker Containers&lt;/ulink&gt;,
             you can create a Yocto Project development environment that
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------A50357682A6D26AE5EE71C4C--
