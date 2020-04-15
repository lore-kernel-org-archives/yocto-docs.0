Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.19428.1586970815648328954
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Apr 2020 10:13:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TOwoQp3i;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id t40so118779pjb.3
        for <docs@lists.yoctoproject.org>; Wed, 15 Apr 2020 10:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=atW96jwORDVC0ob9DxfzSlv0xtcZMGkeFej6AfzPaKU=;
        b=TOwoQp3iHZWeIaBnd3NO+ojM4E+PFtIAKkr/K0xIjK7QD6eDdWJGE+H/5p05yPNXBQ
         As8/pkfjj7rj/mMhV+pNDQqTU51pLtKzBV1nx8ffjd1fOodTHm6JFYQlNUhHC6Z5vdE3
         Jg8lTPWw+2V4B0c70w30wKpKdzRYCM92TmkR6OZrlMSu1KMnJGgLpTIBzz5y6c3wkw1L
         s5twpMh5w42IzpRaBzD5YSUev0fnUltsiIP3YqQOGCfI5We+eVVO4byDCyPd/d3S3a7y
         Oql8dRO6rWVuBhePiRyfTwX+hynbCeH0lBRH3IY/Cap8hOiUDR/VVMTkTCK+fVQ4sruk
         PL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=atW96jwORDVC0ob9DxfzSlv0xtcZMGkeFej6AfzPaKU=;
        b=fo2XXVnsP7s+Hp005cNdmlcmcq7IN7tLTQTXRSgm+spUb0w0tfIxgMUcHSBq6+HCt+
         xYA/zGQiB+/CX25qK7EZhczER6ydI56ugniJMND0YwLO6Sk1SwDKJY4OgxAC6FwZbONJ
         ttmX7UXD7U9GlkF23GkK7CdRXfBGkNKjg6Opu2vMNqEtu5F8ubFVCBopFSKol6QGIBns
         x0wRPGOkXuj03ZVkCw4n+yFHGt9WyZdSP6FHjF8AyIxcGYXQHEO2jj6eFDRkYA57LFd0
         fUtWsfl4izkVY1UU5jiunkvNQHwOdi01viXcPJ20OC2fIK81ksbLC5yFYfdNR4BOv8hk
         pUsA==
X-Gm-Message-State: AGi0PuY+/21xIErpsWIjLAJ2hubqhfGT5fkwq7iqckKrXBQSPFxLELkp
	RvNchiYiEEMP5PwDAie768M=
X-Google-Smtp-Source: APiQypJAYwhfYRbg/CH/iNdJHf8oMzcHbAuBgP5YMPTaHcpQ2j+SmaZ3INCJph2mjijo+X2YSEVc8w==
X-Received: by 2002:a17:90a:fa01:: with SMTP id cm1mr227201pjb.113.1586970815085;
        Wed, 15 Apr 2020 10:13:35 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:c885:40f8:b7ee:f5bd? ([2601:202:4180:a5c0:c885:40f8:b7ee:f5bd])
        by smtp.gmail.com with ESMTPSA id x6sm978837pfd.198.2020.04.15.10.13.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2020 10:13:34 -0700 (PDT)
Subject: Re: [docs] Possible changes to the project docs
To: docs@lists.yoctoproject.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <135fccacd4ee8a1ffe0e06f6f95c22e05dadf04a.camel@linuxfoundation.org>
 <CAP71WjwnFkx4R4Wk__01y5vNJnX_70PUqoVNJ1=QxT8pqf-Lyw@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <2d409521-0a9d-edf9-ff0e-a33fb66b5ac8@gmail.com>
Date: Wed, 15 Apr 2020 10:13:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAP71WjwnFkx4R4Wk__01y5vNJnX_70PUqoVNJ1=QxT8pqf-Lyw@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------7990503E0A813E57DDA2305C"
Content-Language: en-US

--------------7990503E0A813E57DDA2305C
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 4/15/20 8:37 AM, Nicolas Dechesne wrote:
> hi,
>
> On Wed, Apr 15, 2020 at 12:19 PM Richard Purdie
> <richard.purdie@linuxfoundation.org
> <mailto:richard.purdie@linuxfoundation.org>> wrote:
>
>     Since Robert was talking about future docs wide changes, I wanted to
>     put an idea out there. Its something a few of us have talked a littl=
e
>     about. At this point it is an idea, not a decision and something we'=
re
>     thinking we need to explore and evaluate.
>
>     Basically, the thought is whether to move from docbook to sphinx.
>
>
> Good timing. I have been tossing around this idea... As much as I love
> using and reading the YP docs/manual, I know that maintaining and
> updating the documentation 'sources' is rather difficult.

its not that bad IMHO : )

>
>
>     Other projects like the kernel have switched and it could assist som=
e
>     of our website/publishing challenges. It might also be easier for
>     people to contribute to and there are wider and more modern tools
>     supporting that format.
>
>
> Right, and they claimed in https://lwn.net/Articles/692704/:
> "if the documentation can be written in plain text rather than DocBook
> XML, it's more likely to be written in the first place."
>
> I have spent no more than a couple of hours on it, trying to
> understand why the kernel moved and how Sphinx works. The outcome is
> really interesting...=C2=A0 =C2=A0
>
> I use a conversion tool for DocBook .xml to Sphinx/ReST file format
> (pandoc). Of course there are conversion gothas.. but the
> documentation source code becomes much easier.

Cool, a conversion tool. will have to look into it.
>
> See:
> https://people.linaro.org/~nicolas.dechesne/yp-docs/_sources/ref-manual/=
ref-release-process.xml.rst.txt
> vs
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/documentation/ref-ma=
nual/ref-release-process.xml
>
> Or even for the variable glossary (sphinx has builtin support for that):
> https://people.linaro.org/~nicolas.dechesne/yp-docs/_sources/ref-manual/=
ref-variables.xml.rst=C2=A0
> vs
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/documentation/ref-ma=
nual/ref-variables.xml
>
> I have picked the same theme as the Linux kernel documentation, but of
> course, the theme is just HTML and CSS, so it's entirely customizable.=
=C2=A0
>
> For now, only 3 manuals were converted, the html output looks like that:
> https://people.linaro.org/~nicolas.dechesne/yp-docs/
>
> I have made a couple of patches to show how to get there:
> https://git.linaro.org/people/nicolas.dechesne/poky.git/log/?h=3Dsphinx=
=C2=A0
>
> It was straightforward to install anything i needed:
> sudo apt install pandoc
> pip3 install sphinx
> # to use the non default theme
> pip3 install sphinx_rtd_theme
>
> then it's just:
> make html
>
>
>     It'd be a big change, particularly if we consider we may need to
>     convert previous releases of the docs as well as the current version=
.
>     That said, if we were going to do this, the time could be now...
>
>
> The intent is just to show where this could lead us. We need to ensure
> that it will not affect the quality of our documentation, which is
> obviously one of the project's gems!

I am in the middle of doing clean up work to remove "Common" code into
their own files. This allow us to make a fix in one place instead of
updating all the manuals.

This is what happens for every new dot release.=C2=A0 I did that for Zeus =
and
Warrior and is silly to have to do and is what prompted to clean this
up.=C2=A0 I hope sphinx will allow a similar structure as updating 11 file=
s
with the same information is not a good use of time.

- armin
> =C2=A0
>
>
>     Cheers,
>
>     Richard
>
>
>
>
>
>
>=20


--------------7990503E0A813E57DDA2305C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 4/15/20 8:37 AM, Nicolas Dechesne
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAP71WjwnFkx4R4Wk__01y5vNJnX_70PUqoVNJ1=QxT8pqf-Lyw@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">hi,</div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Wed, Apr 15, 2020 at
            12:19 PM Richard Purdie &lt;<a
              href="mailto:richard.purdie@linuxfoundation.org"
              target="_blank" moz-do-not-send="true">richard.purdie@linuxfoundation.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">Since Robert was talking
            about future docs wide changes, I wanted to<br>
            put an idea out there. Its something a few of us have talked
            a little<br>
            about. At this point it is an idea, not a decision and
            something we're<br>
            thinking we need to explore and evaluate.<br>
            <br>
            Basically, the thought is whether to move from docbook to
            sphinx.<br>
          </blockquote>
          <div><br>
          </div>
          <div>Good timing. I have been tossing around this idea... As
            much as I love using and reading the YP docs/manual, I know
            that maintaining and updating the documentation 'sources' is
            rather difficult.</div>
        </div>
      </div>
    </blockquote>
    <br>
    its not that bad IMHO : )<br>
    <br>
    <blockquote type="cite"
cite="mid:CAP71WjwnFkx4R4Wk__01y5vNJnX_70PUqoVNJ1=QxT8pqf-Lyw@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <br>
            Other projects like the kernel have switched and it could
            assist some<br>
            of our website/publishing challenges. It might also be
            easier for<br>
            people to contribute to and there are wider and more modern
            tools<br>
            supporting that format.<br>
          </blockquote>
          <div><br>
          </div>
          <div>Right, and they claimed in <a
              href="https://lwn.net/Articles/692704/" target="_blank"
              moz-do-not-send="true">https://lwn.net/Articles/692704/</a>:</div>
          "if the documentation can be written in plain text rather than
          DocBook XML, it's more likely to be written in the first
          place."</div>
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>I have spent no more than a couple of hours on it, trying
            to understand why the kernel moved and how Sphinx works. The
            outcome is really interesting...   </div>
          <div><br>
          </div>
          <div>
            <div>I use a conversion tool for DocBook .xml to Sphinx/ReST
              file format (pandoc). Of course there are conversion
              gothas.. but the documentation source code becomes much
              easier. <br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Cool, a conversion tool. will have to look into it.<br>
    <blockquote type="cite"
cite="mid:CAP71WjwnFkx4R4Wk__01y5vNJnX_70PUqoVNJ1=QxT8pqf-Lyw@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>
            <div><br>
            </div>
            <div>See:</div>
            <div><a
href="https://people.linaro.org/~nicolas.dechesne/yp-docs/_sources/ref-manual/ref-release-process.xml.rst.txt"
                target="_blank" moz-do-not-send="true">https://people.linaro.org/~nicolas.dechesne/yp-docs/_sources/ref-manual/ref-release-process.xml.rst.txt</a></div>
            <div>vs</div>
            <div><a
href="http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/documentation/ref-manual/ref-release-process.xml"
                target="_blank" moz-do-not-send="true">http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/documentation/ref-manual/ref-release-process.xml</a></div>
            <div><br>
            </div>
            <div>Or even for the variable glossary (sphinx has builtin
              support for that):</div>
            <div><a
href="https://people.linaro.org/~nicolas.dechesne/yp-docs/_sources/ref-manual/ref-variables.xml.rst"
                target="_blank" moz-do-not-send="true">https://people.linaro.org/~nicolas.dechesne/yp-docs/_sources/ref-manual/ref-variables.xml.rst</a> </div>
            <div>vs</div>
            <div><a
href="http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/documentation/ref-manual/ref-variables.xml"
                target="_blank" moz-do-not-send="true">http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/documentation/ref-manual/ref-variables.xml</a><br>
            </div>
            <div><br>
            </div>
            <div>I have picked the same theme as the Linux kernel
              documentation, but of course, the theme is just HTML and
              CSS, so it's entirely customizable. <br>
            </div>
            <div><br>
            </div>
            <div>For now, only 3 manuals were converted, the html output
              looks like that:</div>
            <div><a
                href="https://people.linaro.org/~nicolas.dechesne/yp-docs/"
                target="_blank" moz-do-not-send="true">https://people.linaro.org/~nicolas.dechesne/yp-docs/</a><br>
            </div>
            <div><br>
            </div>
            <div>I have made a couple of patches to show how to get
              there:</div>
            <div><a
href="https://git.linaro.org/people/nicolas.dechesne/poky.git/log/?h=sphinx"
                target="_blank" moz-do-not-send="true">https://git.linaro.org/people/nicolas.dechesne/poky.git/log/?h=sphinx</a> </div>
            <div><br>
            </div>
            <div>It was straightforward to install anything i needed:<br>
              sudo apt install pandoc<br>
              pip3 install sphinx<br>
              # to use the non default theme<br>
              pip3 install sphinx_rtd_theme<br>
              <br>
            </div>
            <div>then it's just:</div>
            <div>make html</div>
            <div><br>
            </div>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <br>
            It'd be a big change, particularly if we consider we may
            need to<br>
            convert previous releases of the docs as well as the current
            version.<br>
            That said, if we were going to do this, the time could be
            now...<br>
          </blockquote>
          <div><br>
          </div>
          <div>The intent is just to show where this could lead us. We
            need to ensure that it will not affect the quality of our
            documentation, which is obviously one of the project's gems!
            <br>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    I am in the middle of doing clean up work to remove "Common" code
    into their own files. This allow us to make a fix in one place
    instead of updating all the manuals.<br>
    <br>
    This is what happens for every new dot release.  I did that for Zeus
    and Warrior and is silly to have to do and is what prompted to clean
    this up.  I hope sphinx will allow a similar structure as updating
    11 files with the same information is not a good use of time.<br>
    <br>
    - armin<br>
    <blockquote type="cite"
cite="mid:CAP71WjwnFkx4R4Wk__01y5vNJnX_70PUqoVNJ1=QxT8pqf-Lyw@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <br>
            Cheers,<br>
            <br>
            Richard<br>
            <br>
            <br>
            <br>
            <br>
            <br>
          </blockquote>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------7990503E0A813E57DDA2305C--
