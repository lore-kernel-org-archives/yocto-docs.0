Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web09.13142.1582312024736389754
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Feb 2020 11:07:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CrxLc2rP;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id m13so1175618pjb.2
        for <docs@lists.yoctoproject.org>; Fri, 21 Feb 2020 11:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=pg+7S8uYKDNq0DM6CT1+CCXOmYlkbad4U241xEoL9dw=;
        b=CrxLc2rPMo8QPQVBICX906qgObnKxoC4KmTQKWu5FhsVp8/6WbZIQq3WcdudwxxOBl
         aREe5gMtD+1ESEvyyUcIGhz+OdNYDGNU2eLZTbOSpfsloGv7nuMVrBEV+o2UcOAJEzcO
         sR9jc3RRgdAQPmZVnBhrjWZMzgPRfXu9VARqK9xShm0oiO2xoAQVTSz6zvHj2+1OJHbX
         bBBQkOTdCuRCpoq6Shn7H2HI+0Oeetbo4c37AYerS7HgX/5ky81ZYx9uq5/qG907Rla/
         5nBXRC9Qa+Jh8DXjMHbc14GvqWX/fAbBD2CEKMx1X7rMEcdt9gFV11NlGtKNgcluoleZ
         X3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=pg+7S8uYKDNq0DM6CT1+CCXOmYlkbad4U241xEoL9dw=;
        b=LiwsLKdQecfiM2sqcjVxFfGfEONzwCT4hHZ1YCV6j2mI73ZWQ10YjCLc12AfITxKuF
         8OmN/+tEACLBv81juDAb/nKyd+RX+4sORIEJxAV4n4DmGFgmlNRx/BE6Iydfv4YgRk38
         HAqt3G+vFuN7+yN3O5lZkG3xA0kZ4y570N0/COw5lhibx4SGKHzOyhhzZDWUE+fyWgZ9
         QSnmhU7KqfixKMHQLbbrr6dPSM2YZh4T2etIXa9y4/eW5x2QvBx5J7MR2g+2Yzp0yoBK
         boXnZCCGNylvBdBxjApR8zCSBLTMQ0vmjRRr9U9dUKYjLQpqoI5xTtzouvESJUSLGlDe
         qaCQ==
X-Gm-Message-State: APjAAAUrvPUMaonScZawHse30bKbaRXw6lL5iFxwxRIBz0IjeGx3N46C
	ZpDh7IyQtt2ueKIVcBmuPP1hWC4w
X-Google-Smtp-Source: APXvYqxxAwh+ytOk71eN4lhJZyMBg2hT4iLr1oiIt8N4XBikSchqEbK31pqR/39KD4jCUJHOFIxmWA==
X-Received: by 2002:a17:90a:2e86:: with SMTP id r6mr4694880pjd.104.1582312023854;
        Fri, 21 Feb 2020 11:07:03 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:dda2:81fa:6982:d91f? ([2601:202:4180:a5c0:dda2:81fa:6982:d91f])
        by smtp.gmail.com with ESMTPSA id c3sm3781133pfj.159.2020.02.21.11.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2020 11:07:02 -0800 (PST)
Subject: Re: [docs] what about more current security links for section 3.18 in dev manual?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <alpine.LFD.2.21.2002170408230.2313534@localhost.localdomain>
Cc: docs@lists.yoctoproject.org
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <ffb95f6b-72ea-cf64-24e9-b0a62942f006@gmail.com>
Date: Fri, 21 Feb 2020 11:07:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2002170408230.2313534@localhost.localdomain>
Content-Type: multipart/alternative;
 boundary="------------F57ECE7300824503943F7762"
Content-Language: en-US

--------------F57ECE7300824503943F7762
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Robert,



On 2/17/20 1:11 AM, rpjday@crashcourse.ca wrote:
>   currently perusing dev manual, 3.18, "Making Images More Secure",
> https://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#making-images-more-secure
> and the newest link there is from 2014 (even older ones are from 2012
> and 2009.
>
>   if people want to recommend newer online resources, i'll update the
> links in that section.
I found this doc on-line an plan on adding a link in the meta-security
layer.

https://www.nccgroup.trust/us/our-research/improving-your-embedded-linux-security-posture-with-yocto/

maybe its applicable for the YP docs?

- armin

>
> rday
>
> 


--------------F57ECE7300824503943F7762
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    Robert,<br>
    <br>
    <br>
    <br>
    <div class="moz-cite-prefix">On 2/17/20 1:11 AM,
      <a class="moz-txt-link-abbreviated" href="mailto:rpjday@crashcourse.ca">rpjday@crashcourse.ca</a> wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:alpine.LFD.2.21.2002170408230.2313534@localhost.localdomain">
      <pre class="moz-quote-pre" wrap="">
  currently perusing dev manual, 3.18, "Making Images More Secure",
<a class="moz-txt-link-freetext" href="https://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#making-images-more-secure">https://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#making-images-more-secure</a>
and the newest link there is from 2014 (even older ones are from 2012
and 2009.

  if people want to recommend newer online resources, i'll update the
links in that section.</pre>
    </blockquote>
    I found this doc on-line an plan on adding a link in the
    meta-security layer. <br>
    <br>
<a class="moz-txt-link-freetext" href="https://www.nccgroup.trust/us/our-research/improving-your-embedded-linux-security-posture-with-yocto/">https://www.nccgroup.trust/us/our-research/improving-your-embedded-linux-security-posture-with-yocto/</a><br>
    <br>
    maybe its applicable for the YP docs?<br>
    <br>
    - armin<br>
    <br>
    <blockquote type="cite"
      cite="mid:alpine.LFD.2.21.2002170408230.2313534@localhost.localdomain">
      <pre class="moz-quote-pre" wrap="">

rday
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------F57ECE7300824503943F7762--
