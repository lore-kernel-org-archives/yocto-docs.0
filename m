Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web12.2019.1588161074193166064
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Apr 2020 04:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=O0A7tplb;
 spf=pass (domain: linaro.org, ip: 209.85.219.169, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f169.google.com with SMTP id l84so1125679ybb.1
        for <docs@lists.yoctoproject.org>; Wed, 29 Apr 2020 04:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=ayXBoo293I2HowaXnozTTvaiXXmEdO91qUktkf1ELok=;
        b=O0A7tplbI+17KP0WJD6aGSa+u8FcaMUW7muxMGGnX28fmBfuUG+FIF+h815nNovQ/r
         38b50odLZigEAYGloGNrtVIVPuIj2LF24QxhGp4VzViIDBXxbxQm0Hrjf9XwG4KZcrr2
         0Rt8cK43g7uHuELJ977AbCCaThcYRH0jinsLS9XTxwibQHK0yxOQXWjBL3+IlFRv/HdC
         MBymrxVZtTh3Ekxuf9+tcP0sHVETfOikB6G1gJUkLlp9tsYem9JNj2JzT3IWnHAaZOQr
         fCIqjQks87FI4AD3S1zyeYkavweLTGDsR+ShByiChVkGwYb1MADBJWQ9iN0YtdxiUWi0
         zErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=ayXBoo293I2HowaXnozTTvaiXXmEdO91qUktkf1ELok=;
        b=J0GHb3ESetL6gX01D9piJV0ETPpQsxtooohP5sWS3GJhVka2wvns3gZD1q09LnuqWl
         iyn9Dr3bXKTJHkihrAs7czMz6YgS/jW1LFQ5Wce0E6Gl/cNxjBp5HQtseumXCHqNnynB
         Xcv3YHNP64okLg5EWN2c9kjcxcpGs9E0oHD4gCilG8eCplc8qGj2IaN5ofYWg9cCB+F5
         u5EnWo/Ksfzj8PGu6PfyW7PB9rpP2zGsIkhd9Yk5zkPy0brMNPjq9KKsFXN/ASuuuKMg
         mI1hc56cQxiOTNeXVnFs5Dx43mLjnVuBvhIYHGDTAhEZMrwJhH+sCiM3RaXwLHcbQ9cr
         gvOQ==
X-Gm-Message-State: AGi0PuY90im4DwdCLmq22nTpzheoNh+7Y5BGoc18efW18nNFnCaSUTih
	rmXlviZjpiirsVedMxGgpUN7G6uvPEg6u8C2MaarEotPuws1IQ==
X-Google-Smtp-Source: APiQypIBqH5g3UnaGqY3smfgWxHGLx1vJIU6uHq4D4b56+RHz44aqohazD9r6UZxqfCOmkHsYaG8TFy/KqUd78GrYaM=
X-Received: by 2002:a25:c695:: with SMTP id k143mr41873000ybf.397.1588161073025;
 Wed, 29 Apr 2020 04:51:13 -0700 (PDT)
MIME-Version: 1.0
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 29 Apr 2020 13:51:02 +0200
Message-ID: <CAP71WjwAtPKx84GAoT7xBusgzhPqth3e-6Ef89pDZDnYeyJyRw@mail.gmail.com>
Subject: Season of Docs
To: docs@lists.yoctoproject.org, Trevor Woerner <twoerner@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000009abced05a46c90b1"

--0000000000009abced05a46c90b1
Content-Type: text/plain; charset="UTF-8"

hi,

The Google Season of Docs program for 2020 has started, and the Yocto
Project is applying this year. The deadline is next Monday (May 4th), and
we will know the results one week later. More information on the Season of
Docs program can be found at:
https://developers.google.com/season-of-docs

We have created the following wiki page:
https://wiki.yoctoproject.org/wiki/SeasonOfDocs

We would like to capture a list of ideas for improvements of the Yocto
Project documentation there. If you want to contribute to the list of
ideas, please edit this wiki page. If you want to be a mentor for the
program, please let me know. If you want to understand what mentoring
implies, please check:
https://developers.google.com/season-of-docs/docs/mentor-guide

If you have any questions, feel free to ask!

cheers
nico

--0000000000009abced05a46c90b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">hi,<div><br></div><div>The Google Season of Docs program f=
or 2020 has started, and the Yocto Project is applying this year. The deadl=
ine is next Monday (May 4th), and we will know the results one week later. =
More information on the Season of Docs program can be found at:</div><div><=
a href=3D"https://developers.google.com/season-of-docs">https://developers.=
google.com/season-of-docs</a><br></div><div><br></div><div>We have created =
the following wiki page:</div><div><a href=3D"https://wiki.yoctoproject.org=
/wiki/SeasonOfDocs">https://wiki.yoctoproject.org/wiki/SeasonOfDocs</a><br>=
</div><div><br></div><div>We would like to capture a list of ideas for impr=
ovements of the Yocto Project documentation there. If you want to contribut=
e to the list of ideas, please edit this wiki page. If you want to be a men=
tor for the program, please let me know. If you want to understand what men=
toring implies, please check:=C2=A0</div><div><a href=3D"https://developers=
.google.com/season-of-docs/docs/mentor-guide">https://developers.google.com=
/season-of-docs/docs/mentor-guide</a><br></div><div><br></div><div>If you h=
ave any questions, feel free to ask!</div><div><br></div><div>cheers</div><=
div>nico</div><div><br></div></div>

--0000000000009abced05a46c90b1--
