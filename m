Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web11.3354.1593159137828291429
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Jun 2020 01:12:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=KcTyc+lg;
 spf=pass (domain: linaro.org, ip: 209.85.219.169, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f169.google.com with SMTP id j19so1050068ybj.1
        for <docs@lists.yoctoproject.org>; Fri, 26 Jun 2020 01:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/NLlZ3PIUYKdIM5MbmFWvEsy6flrOmaYHs8iZ/69ID0=;
        b=KcTyc+lg1KQdFx+8JyON9TbxfejSN7vbtl3XnLzb0xXKfexg+BbMQc+ifO9C/WqeXu
         k6p/ZT+GIoNJlbBA1J+S0NbCqGmwW/UKkiZToNqd2WHWUudAvaiK4NXdVbXIrABbo+kY
         HJIKq6ULlMz51GBuDRDJ1CPrPNq5vqrGefLxkZXmj/xVjL8Q8Waqj002YJmnpuI5Bbuy
         ek0cgW2VNexiPb1DUJI1yAnXtTLaWjiKUtLzLN3cHI4CFezpqWrUkwVPRScY8xXvQI2r
         XHVKM73ECfnNUDAZm2emvaihhMd/NchWAcftrgANuUP1xWdd642Su3yiiVgIUbUsTzr4
         ufrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/NLlZ3PIUYKdIM5MbmFWvEsy6flrOmaYHs8iZ/69ID0=;
        b=eABD9qkbSid/ht0Fm4+19LwkyXEtyZMwRal+m3ozuY87raFNsjp4SJTIYHPD8+sGY+
         +yPrPLllsugG7UsSjrgnECrOTnYmnecOLidKQx20qX7T/QKPfUxONVE+nr49FDCgV4fN
         ni8/yB7DpwiL0Nhm3af7MTWCM2qI4HQRvo8KemOoImjD8Q5f27wDd9nf035ya8HhnXNG
         oJvzFkZDtSJ/D+r3jQzQUplvdrg8Wko7hyxiqet7+iyACOK7pAZ0zyw4sV10XZI0SleA
         GUtsqA8hfFAaMbW/L+mL/+S0Ghg2gdkrn/p6h/hiDKbvK4baVevKBPO2KdXmzAIEtmnI
         /HaQ==
X-Gm-Message-State: AOAM531GgCaDH7XcrtQPIgDlysHnV7hoD+g4XCjdTswLO1HhsUVzwNWD
	oqCMoqY8VVaKNQRhSKrcqz6uA2c7BY0zhqr7WP/GfA==
X-Google-Smtp-Source: ABdhPJz2lg838kCjsfs3Pr5Z63gQJWtBZ+Oj9fs3GvCxE+eSWj5uyQlHS5QE1riRYdYRecYTDqlU4Q7ry6//rkqAROE=
X-Received: by 2002:a25:388d:: with SMTP id f135mr3028589yba.201.1593159136760;
 Fri, 26 Jun 2020 01:12:16 -0700 (PDT)
MIME-Version: 1.0
References: <brBieKgFlfS0C1xLUD5I5LQ0ZKxNBkhcCwKfuzqZTPTQv9slA-1bH2sneuut6k6lMlCO1n_03w5D65oBcbwU2u9Q3ZdmvT-vUWqrLI2jN5c=@protonmail.com>
 <a1ce3e159c94a1826ff718670c8e3bb2195c155c.camel@linuxfoundation.org>
 <CAP71Wjz3=ugDGyfDirANko1KSXC-3qkfYGsuMAkuQ4QhTamzWA@mail.gmail.com> <fd811933-cb7e-d4fc-5363-4679f9e236fc@gmail.com>
In-Reply-To: <fd811933-cb7e-d4fc-5363-4679f9e236fc@gmail.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 26 Jun 2020 10:12:05 +0200
Message-ID: <CAP71Wjz8QeY9NkpR1Mmee4qpMWF-j-iJ_s+BqVH0DXd8O20WSQ@mail.gmail.com>
Subject: Re: [docs] Modern style documentation
To: akuster808 <akuster808@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, marius.kriegerowski@protonmail.com, 
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000006ae99a05a8f8447a"

--0000000000006ae99a05a8f8447a
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 25, 2020 at 7:37 PM akuster808 <akuster808@gmail.com> wrote:

> Hello,
>
>
> On 6/24/20 7:27 AM, Nicolas Dechesne wrote:
>
> On Wed, Jun 24, 2020 at 4:23 PM Richard Purdie<richard.purdie@linuxfoundation.org> <richard.purdie@linuxfoundation.org> wrote:
>
> Hi,
>
> On Wed, 2020-06-24 at 14:05 +0000, Marius Kriegerowski vialists.yoctoproject.org wrote:
>
> Dear Community,
> I would like to motivate a re-structuring of the documentation. The
> single page documenting mega manual is great as it carries all the
> information. But at the same time it is hard to navigate,
> overwhelming for early stage users and hard to pick up where started
> earlier on.
> Are there plans that break this single page documentation?
>
> To be more constructive: I find it very convenient and I highly
> recommend a permanently shown navigation bar, highlighting where the
> current content is located. This allows to find information again,
> even if a user only has a vague idea where a piece of information was
> found last time, simply thanks to the iinherent structural pattern,
> not only the text describing the chapters. Let's take advantage of
> the humans being better at remembering shapes and patterns rather
> than text and content.
>
> If this undertaking is already on it's way I'd be happy to join.
>
> Sorry I missed the meeting. I had a conflict with an internal meeting.
>
> One thing I would like to add to the things to look into is the ability to:
>
> 1) Build documentation via a recipe
>
2) Include documention  in an SDK
>
>
> #1 is more for Build automation checkout etc and is needed for #2
>
> I realize this may be a meta-poky thing only.
>

Can you elaborate on what you are asking here? A recipe would need to
'fetch' the document sources with a fixed SRCREV. Or do you want to build
the 'current' set of files from the documentation folder?


> Are there any other meeting scheduled?
>

Not at this point of time. I believe the next step was discussion/agreement
from the TSC. and once that is done, we will start pushing a sphinx branch
and hack on it.


>
>
>
> - armin
>
> I did notice the discussion on irc.
>
> FWIW we're in the middle of planning to migrate the documentation from
> its current format in docbook over to sphinx. I think that should give
> us more options for what you describe with navigation in amongst
> various other advantages.
>
> Help with the migration would be much appreciated and we'll keep this
> need in mind as we work through the details of this.
>
> I do think we'll end up with some kind of combination of both formats
> since some people do need something searchable/scrollable but I realise
> others need the navigation interface more, there is a place/need for
> both.
>
> FWIW. you can check our current work-in-progress thoughts on this topic here:https://wiki.yoctoproject.org/wiki/index.php?title=Documentation_Sphinx
>
>  Cheers,
>
> Richard
>
>
>
>
> 
>
>
>

--0000000000006ae99a05a8f8447a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 25, 2020 at 7:37 PM akust=
er808 &lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
  
    
  
  <div>
    Hello,<br>
    <br>
    <br>
    <div>On 6/24/20 7:27 AM, Nicolas Dechesne
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>On Wed, Jun 24, 2020 at 4:23 PM Richard Purdie
<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">&l=
t;richard.purdie@linuxfoundation.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre>Hi,

On Wed, 2020-06-24 at 14:05 +0000, Marius Kriegerowski via
<a href=3D"http://lists.yoctoproject.org" target=3D"_blank">lists.yoctopro=
ject.org</a> wrote:
</pre>
        <blockquote type=3D"cite">
          <pre>Dear Community,
I would like to motivate a re-structuring of the documentation. The
single page documenting mega manual is great as it carries all the
information. But at the same time it is hard to navigate,
overwhelming for early stage users and hard to pick up where started
earlier on.
Are there plans that break this single page documentation?

To be more constructive: I find it very convenient and I highly
recommend a permanently shown navigation bar, highlighting where the
current content is located. This allows to find information again,
even if a user only has a vague idea where a piece of information was
found last time, simply thanks to the iinherent structural pattern,
not only the text describing the chapters. Let&#39;s take advantage of
the humans being better at remembering shapes and patterns rather
than text and content.

If this undertaking is already on it&#39;s way I&#39;d be happy to join.</=
pre>
        </blockquote>
      </blockquote>
    </blockquote>
    Sorry I missed the meeting. I had a conflict with an internal
    meeting.<br>
    <br>
    One thing I would like to add to the things to look into is the
    ability to:<br>
    <br>
    1) Build documentation via a recipe=C2=A0</div></blockquote><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div>
    2) Include documention=C2=A0 in an SDK<br>
    <br>
    <br>
    #1 is more for Build automation checkout etc and is needed for #2<br>
    <br>
    I realize this may be a meta-poky thing only.<br></div></blockquote><d=
iv><br></div><div>Can you elaborate on what you are asking here? A recipe w=
ould need to &#39;fetch&#39; the document sources with a fixed SRCREV. Or d=
o you want to build the &#39;current&#39; set of files from the documentati=
on folder?=C2=A0=C2=A0</div><div><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div>
    <br>
    Are there any other meeting scheduled?<br></div></blockquote><div><br>=
</div><div>Not at this point of time. I believe the next step was discussio=
n/agreement from the TSC. and once that is done, we will start pushing a sp=
hinx branch and hack on it.</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div>
    <br>
    <br>
    <br>
    - armin<br>
    <blockquote type=3D"cite">
      <blockquote type=3D"cite">
        <pre>I did notice the discussion on irc.

FWIW we&#39;re in the middle of planning to migrate the documentation from
its current format in docbook over to sphinx. I think that should give
us more options for what you describe with navigation in amongst
various other advantages.

Help with the migration would be much appreciated and we&#39;ll keep this
need in mind as we work through the details of this.

I do think we&#39;ll end up with some kind of combination of both formats
since some people do need something searchable/scrollable but I realise
others need the navigation interface more, there is a place/need for
both.
</pre>
      </blockquote>
      <pre>FWIW. you can check our current work-in-progress thoughts on th=
is topic here:
<a href=3D"https://wiki.yoctoproject.org/wiki/index.php?title=3DDocumentat=
ion_Sphinx" target=3D"_blank">https://wiki.yoctoproject.org/wiki/index.php?=
title=3DDocumentation_Sphinx</a>


</pre>
      <blockquote type=3D"cite">
        <pre>Cheers,

Richard


</pre>
        <br>
        <fieldset></fieldset>
        <pre>
</pre>
      </blockquote>
    </blockquote>
    <br>
  </div>

</blockquote></div></div>

--0000000000006ae99a05a8f8447a--
