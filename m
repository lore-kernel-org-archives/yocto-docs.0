Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web12.7249.1586617557906882541
 for <docs@lists.yoctoproject.org>;
 Sat, 11 Apr 2020 08:05:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DCq3MXZg;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id x2so1665722plv.13
        for <docs@lists.yoctoproject.org>; Sat, 11 Apr 2020 08:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=YSWLYPZYV4jvQjeQ05SpMXajmmyWk4CFs8IgtrqLFoI=;
        b=DCq3MXZgLO1sA8/u2xH6Y6k52bRg0PFNwvL8AsfuIaTJ7PllHLr9ZoQbP/wI+zWdT2
         QJyN9n2RJc8REWwTviJm3yh69QsVH7h5QfTNQmhZLxL4R5wVQcfuNIpi8ngnfpdA0sxK
         fnCk4p96bUejjrCZDZhcxGLh92HsLb12EaUgTzypOtVodcBzEW1pILEACt165crrUkFK
         1wVqsIv+D1BPI/nt/2z6J6aeGHamyDaj6H28/YyLZ+sU1ozsiJKmB7vJZI60GUEKwo8k
         jIG67ypFQpVdiDHxYy+tcZVqAwqodU5BC4Kv2b2xeNMzNSI+/fJ3jsbNDEtoFQS5hUXi
         fWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=YSWLYPZYV4jvQjeQ05SpMXajmmyWk4CFs8IgtrqLFoI=;
        b=dxFDzRXhVYnVM3x5ct5XlKRzSxPphL0LeKIzY20+AMNO8ZDyG6LJl2gf7e96VK3uUF
         BrdLHvHOyATxHD3kILroA2aBMkSXxJygfOpXXkf9U3TVMFh5Wmb5BBoODAnd0E4uTQG/
         XzkcI7zks54NzGvFH63/gXNYjFmllK5jtcO+gt5s1qGFv6v27U/cL4PuezHOBztwz6jf
         bbeo4bwcBgr9oAdiJI2+Qj9mYHHxCF2ZKpdV1naJgc5zRxkbGykte9+7vxTa2aI3rsgy
         0DBkRAN+FDl/3KxRo3/TO17pKIc4p4/DjPmwDlj14npfNcCylsMGJvBeNi7yyGnNvcm7
         lTjg==
X-Gm-Message-State: AGi0Pub5061soYdrK+Xm/mtesvk1OdvVBK5myw8nSCfbnBPdALlZtJJ2
	2+wVmePic2dWZk4wyuXVm3/mgNJ7ytI=
X-Google-Smtp-Source: APiQypIE2Lr+sSHgXDd3x1Ha+zXeHlmhsVKmnTgtD/h3wTNZwdaqQDW5QYo/lfGGdgEu/CE8WqbrAQ==
X-Received: by 2002:a17:902:b283:: with SMTP id u3mr9232444plr.311.1586617557129;
        Sat, 11 Apr 2020 08:05:57 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:e49d:5859:161:36cd? ([2601:202:4180:a5c0:e49d:5859:161:36cd])
        by smtp.gmail.com with ESMTPSA id 24sm12049pfn.145.2020.04.11.08.05.55
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2020 08:05:56 -0700 (PDT)
Subject: Re: [docs] [PATCH] overview-manual: fix obvious typo "ORHNAME"
To: docs@lists.yoctoproject.org
References: <alpine.LFD.2.21.2004070543020.6200@localhost.localdomain>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <b96d5f4d-1762-2850-3438-6f5580903920@gmail.com>
Date: Sat, 11 Apr 2020 08:05:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2004070543020.6200@localhost.localdomain>
Content-Type: multipart/alternative;
 boundary="------------9197655F7AE2FE0F563DEEB9"
Content-Language: en-US

--------------9197655F7AE2FE0F563DEEB9
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 4/7/20 2:43 AM, Robert P. J. Day wrote:
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

thanks for finding and fixing.

- armin
>
> ---
>
> diff --git a/documentation/overview-manual/overview-manual.xml b/documentation/overview-manual/overview-manual.xml
> index 24b50207c..210d644b3 100755
> --- a/documentation/overview-manual/overview-manual.xml
> +++ b/documentation/overview-manual/overview-manual.xml
> @@ -23,7 +23,7 @@
>          <authorgroup>
>              <author>
>                  <affiliation>
> -                    <orgname>&ORHNAME;</orgname>
> +                    <orgname>&ORGNAME;</orgname>
>                  </affiliation>
>                  <email>&ORGEMAIL;</email>
>              </author>
>
>
> 


--------------9197655F7AE2FE0F563DEEB9
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 4/7/20 2:43 AM, Robert P. J. Day
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:alpine.LFD.2.21.2004070543020.6200@localhost.localdomain">
      <pre class="moz-quote-pre" wrap="">
Signed-off-by: Robert P. J. Day <a class="moz-txt-link-rfc2396E" href="mailto:rpjday@crashcourse.ca">&lt;rpjday@crashcourse.ca&gt;</a></pre>
    </blockquote>
    <br>
    thanks for finding and fixing.<br>
    <br>
    - armin<br>
    <blockquote type="cite"
      cite="mid:alpine.LFD.2.21.2004070543020.6200@localhost.localdomain">
      <pre class="moz-quote-pre" wrap="">

---

diff --git a/documentation/overview-manual/overview-manual.xml b/documentation/overview-manual/overview-manual.xml
index 24b50207c..210d644b3 100755
--- a/documentation/overview-manual/overview-manual.xml
+++ b/documentation/overview-manual/overview-manual.xml
@@ -23,7 +23,7 @@
         &lt;authorgroup&gt;
             &lt;author&gt;
                 &lt;affiliation&gt;
-                    &lt;orgname&gt;&amp;ORHNAME;&lt;/orgname&gt;
+                    &lt;orgname&gt;&amp;ORGNAME;&lt;/orgname&gt;
                 &lt;/affiliation&gt;
                 &lt;email&gt;&amp;ORGEMAIL;&lt;/email&gt;
             &lt;/author&gt;

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------9197655F7AE2FE0F563DEEB9--
