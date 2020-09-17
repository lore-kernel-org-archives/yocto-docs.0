Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.12333.1600338023410941752
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Sep 2020 03:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=UUPj0Ds2;
 spf=pass (domain: linaro.org, ip: 209.85.219.169, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f169.google.com with SMTP id a2so1318218ybj.2
        for <docs@lists.yoctoproject.org>; Thu, 17 Sep 2020 03:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=dDovjKBnRa8uk2hfJ73iU/o+/2yWAnsd794memSmM5Q=;
        b=UUPj0Ds2cHgZIItDEtvoynKqNBf0Wn0hZXgtRTEURgtAsn3MI+BD+KBUQQ48YyBSgA
         +PqCSN/I2vUdVW8Ng4xIx8V2hwwSH0yffASWWgDjg6uerrZbINUnLEwfAVUuAqehL5mB
         qTjxUW13LfMX5+LST3CG96ZKJ3/WAOpYOWIIywzj/Bhw8sHggkW8ol2XUEtH2ZJngt5W
         1y+Y50FQC3loRkdEnwZQGqrvuS9R4dI9hsZx4iX4yXDePBJERiuDuCbBriX9aY6CRmlU
         GA020Vhzz4iKXM02lqAko36aNEIy8IoRZJj+AWMXGluypbk7IsbLwRyplP6lO3USAKAc
         lkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=dDovjKBnRa8uk2hfJ73iU/o+/2yWAnsd794memSmM5Q=;
        b=nYW6GCczuCkvbe25hpquN5ZqQyf1VntzDWQr8Lx+faPfg6PsyI9n2ChM0K3aOO9/4y
         IoOt8zhaBDveGGCmBanRyRI7Z3dtnL/FCgCx+oThbDP5Vgh20kICTScW3jy4PioYiv4O
         B45Rk4t4epNQ+1CUpyJz4UgqJQCZ5wHuGBH85/R8LMjw6TmZ8LDVrfGr68QW7soHzPIE
         TVPq0/5iJ1ri+9BTbwFHMMlYhwOlGFpLs21eLgaDeVynplfRjM/6UtUF80cIzxJnrHeD
         lJw1zeHvqmdk3xki7LhC5NcULJrNtFnTDJDdZDGslXrrd07H4/Co8zQfUo1MjuUJio1x
         M5Mg==
X-Gm-Message-State: AOAM531o8pgDd1PP3PvExmaEvxd2+oBQkHJDNXWrS1ffSkHGgbxrs6jx
	fcIf1hgCgplvKn9dnbPYZPxanlA0AMBAvto+4w6lbQHhaF1GrSGt
X-Google-Smtp-Source: ABdhPJzfL76YXO0Qar2RKDYi8uvlug6tKYGmXyt4lTTUKI1zDnbRoCwUQB1xzvluUn6qVR322w0AS0czNwm+Eyntyso=
X-Received: by 2002:a05:6902:4cf:: with SMTP id v15mr40230961ybs.373.1600338022180;
 Thu, 17 Sep 2020 03:20:22 -0700 (PDT)
MIME-Version: 1.0
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 17 Sep 2020 12:20:11 +0200
Message-ID: <CAP71Wjy2t73ZOHjfHd+z_wH1Y8u=yhP=dENeKs2x2_QkSTTQGg@mail.gmail.com>
Subject: [sphinx] updates as of Sep 17th.
To: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Dear all,

I am very excited to report that Richard merged the sphinx branches
today, in both yocto-docs and bitbake. It has been a crazy ride,
especially the last couple of weeks. It was great to see several of
you joining us for the last mile! Many thanks!

Note: we will no longer take patches in the DocBook/XML files, in fact
we might just delete them anytime now.

If I remove the Docbook files locally, I am seeing the following
shortstat for the migration:
yocto-docs:
217 files changed, 56760 insertions(+), 100082 deletions(-)
bitbake:
27 files changed, 6500 insertions(+), 10277 deletions(-)

The Yocto Project documentation website has been updated from the
content of both master branches, see. https://docs.yoctoproject.org/.

The next steps for docs are:
1. keep incoming fixup patches. we are pretty sure there are various
issues left in the sphinx files...
2. document how we 'publish' documentation on the new website (branch,
tags, ..), and implement git hooks so that the website is
automatically up-to-date.
3. merge into dunfell
4. Look at PDF generation. Sphinx is supposed to do that well, but
it's something we haven't tried yet.
5. Carefully review the rendered HTML to see if we are missing any CSS
config from docbook style (we found a few issues this week, but there
might be more). Generally speaking, if anyone notices anything wrong
or weird on the rendered html, please report it as an issue (or better
as a bug on BZ).
6. Finalize the 'transition' pages which are Sphinx based pages for
each existing YP release made so far.
7. Create a 'README/Doc Style Guide' to facilitate new contributions.

cheers
nico
