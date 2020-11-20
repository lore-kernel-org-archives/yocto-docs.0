Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web08.1304.1605910857560957903
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Nov 2020 14:20:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=JcxnAZMQ;
 spf=pass (domain: linaro.org, ip: 209.85.219.181, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f181.google.com with SMTP id r127so6219861yba.10
        for <docs@lists.yoctoproject.org>; Fri, 20 Nov 2020 14:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=UHNpLeOAAfCaHrvrC9wXSIA3xKsPkDe2FflehspltQc=;
        b=JcxnAZMQGFD0HjQ0bcT6qdCP21Qh5GpVdgOcJlITkXGJv7tWVTuHKWeSfaQFYZ1WSc
         yjvzduliabywWFe+luRJvG0xfV0BRq9C01OCCHt/qfqo+XqQ7cubAaZnuVJP4RqsYuMr
         qoNPDtGe2QWQlC2RhdXfNRqVPbMBVKComv33sAJehmwUlJS0rZd91L4h1zXrLEDNaWoQ
         M0JQoNx/jWOypp9QG//d1UJ+jtSuSQOQ47BGDZkjIv5Be9pDmq4ToX711fXBvuxw4XD0
         IYdH1rgeWjftBFTituk6gRXJ+e3lKEuXwc5nGI4dRa+TR5/ilBIzWRgaM5cSqmmEnh3o
         SfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=UHNpLeOAAfCaHrvrC9wXSIA3xKsPkDe2FflehspltQc=;
        b=NT1fvGvZIKXs/FbsqZrPPodT+T0FylmGPG7IBVng8sbr9gQms+RL5Y06Id1IFa5zSL
         MHjJqoebu8W4ZdBrHmHWFiD0nxLo79xIGaIUk5EK5NPsM5Xon3C8InswN34ERtTMZU0P
         7J3Bhk8iCn3o3a8txbkgpwyalWY1SqO7l3wUs5MWysWZ4XBV+cYdE3/eb+0I8O5ysvbn
         PI+Y9tF7lcFcVqyOWx2P0JEiWOfzDcRAZ1g3ZE/u333Fc//C4f8lgIMP2EdbasAYFqgA
         memzo4aJPs53eJwWXitPCLTSXDvJA01PFvVO/YNtjuFCKe7+dIX2sugDTFgiBlRsIU33
         +vOw==
X-Gm-Message-State: AOAM530w2fG7dTVEyUNnk8HXYIOq9p4SFU5sDA3fZDPME2LuAd86bO40
	chlV75bZeMdcxvyx65CA+t3F2lGG09JNJlI6V5oNtEMD0msCieoAWao=
X-Google-Smtp-Source: ABdhPJzpFrgV3RFKGaYzBlY2KlbUc/Ozv7h3rPo1ef3vxabMMiMSyU5RwJ4jOBo8DVUlytQhPQkICsbu6Uuuip+wxZ8=
X-Received: by 2002:a25:318b:: with SMTP id x133mr32636971ybx.201.1605910856436;
 Fri, 20 Nov 2020 14:20:56 -0800 (PST)
MIME-Version: 1.0
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 20 Nov 2020 23:20:45 +0100
Message-ID: <CAP71WjwM3+3SwN9XRO4Cthur7iwQB0O2bKBSh3VQXkGZbYUYWA@mail.gmail.com>
Subject: Sphinx 'backport' for Dunfell LTS
To: YP docs mailing list <docs@lists.yoctoproject.org>, Steve Sakoman <steve@sakoman.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Steve, RP,

I think I am "done" with the 'backport' of Sphinx docs in both
yocto-docs and bitbake. The backport process isn't straightforward..
here is what I did in each case:

1. take all sphinx commits from master branch and squash them into
dunfell. that's a large commit that brings sphinx and removes docbook.
2. because of #1 there are changes that we 'imported' which needed to
be undo'd (e.g. a doc change that was applied to master, but is not
needed in dunfell). To get the list of such changes, I look at each
patch in dunfell vs master.
3. in yocto-docs, I had to 'revert' some patches first before I could
cherry-pick all the sphinx changes, and I have then 're-applied' the
changes later in the branch (of course when I say re-apply, i mean i
did it again in sphinx instead of docbook)
4. Then I took as many patches as possible from 'master' which apply to dunfell.

I understand this is a complex 'merge', and I must admit I have gone
back and forth on whether we should do it..  I couldn't find a simpler
way, but if we merge it and use Sphinx for the next LTS release
(3.1.5), then all active releases docs would now be based on Sphinx.

I have pushed the branches here:
http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/commit/?h=sphinx&id=488a421fea826a2cff27dd009768430769f25ab0
and
https://git.openembedded.org/bitbake/commit/?h=sphinx&id=fe9dde75fa55da08fddd0cce778d3eb6303b2124

It's rather inconvenient to review the series by email (the first
patch is huge), But we can discuss here..

enjoy... or not ;)

nico
