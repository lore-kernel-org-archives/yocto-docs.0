Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.19767.1621262545547744636
 for <docs@lists.yoctoproject.org>;
 Mon, 17 May 2021 07:42:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=PYeWldaG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id h7so3269884plt.1
        for <docs@lists.yoctoproject.org>; Mon, 17 May 2021 07:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tkcJCDNpeGOUTJDtBkwtizNDha5ixGX3pMxkaitVlfU=;
        b=PYeWldaGrfYuyo/zc6RjzKItsdnLi6ZkzTa9WlINEZg0V0s4YCstKF86CBmBQ8dYOW
         x+xWEKNlsMdp1RNRvg/NTcjViXNc9MD/tsqISC+Ge/n/bbYkHXojPAnVlkQ3eVB5MXFs
         yGOYNpa0vR/qotQdQLiyrRIUDQTfV97T9vy3SpBFlJQ4LZ/DnAiariYhisuDqTE/Vvki
         OQPpW3F9oDXEwwzYTA8OwJjBc3wB1ZSEvBs9oQk1U59MuDPcQiFFtm8HRTO/vgqCLAeN
         8MfHhrCrIO4FcbD+cMB7JS4szi8o0C0qFj6qNQPza/z2IpL/NJuRmYWkZOUlH3tfB2kw
         /bYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tkcJCDNpeGOUTJDtBkwtizNDha5ixGX3pMxkaitVlfU=;
        b=ikGC44UEb8vtLyPQRgB2jOTm9E44j0WJYXnmZyRO7jWYsc9xbjKAhESUDDUqL0rmfC
         7+cU3MpaXzBVBsxLzDhBEl0rnIcBts/KQQgGXWveNR/zQFaRcAkEq1hTw56x0GWfU8nC
         iGrTD+CLVi9biR0svNvuOv21aIvhp+8WwCbyfelTqNU6qk8MDzu9h56ibOYDT4cM2t7H
         ZE10UZ7ylJS/+spvIGYzPokyB5+R1FteQKuza8T3W5fIHhBuM632oFaVOwwD9u1VMmu5
         dB15jP+6jBPlwNpOXdjUogGr270+9S2h1sUBICUOA123YdrvxJ0d3qHyjJnOF1H5JEuZ
         c89g==
X-Gm-Message-State: AOAM533z4gfd4V2pTJKtu3sY85BDXt4qUZYCHBuJVQ8qu+Kng/0OEPR4
	H5FQgwg40QTBjROVbHrDJmP+/Y0+SycgSVdm2ik=
X-Google-Smtp-Source: ABdhPJwXARQbHz8HCRCk0k0wag/nwc9zephmn3Qo91PzdXz5FNhsSLGdjjBILk+ErTKvNS/9kBY3fg==
X-Received: by 2002:a17:90a:c68f:: with SMTP id n15mr1666380pjt.112.1621262544362;
        Mon, 17 May 2021 07:42:24 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y64sm9908138pfy.204.2021.05.17.07.42.23
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:42:23 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 0/2] Patch review
Date: Mon, 17 May 2021 04:42:10 -1000
Message-Id: <cover.1621262110.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review this set of patches for dunfell and have comments back by
end of day Wednesday.

The following changes since commit 5a54200a8702e473ecbbc3dbbdaa24169796c9e8:

  documentation: prepare for 3.1.7 release (2021-04-06 08:43:27 -1000)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs contrib/dunfell-next
  http://git.yoctoproject.org/cgit.cgi/yocto-docs/log/?h=contrib/dunfell-next

Steve Sakoman (2):
  ref-system-requirements.rst: Add Fedora 33 to list of supported
    distros
  documentation: prepare for 3.1.8 release

 documentation/conf.py                                | 2 +-
 documentation/poky.yaml                              | 8 ++++----
 documentation/ref-manual/ref-system-requirements.rst | 2 ++
 documentation/releases.rst                           | 1 +
 documentation/sphinx-static/switchers.js             | 2 +-
 5 files changed, 9 insertions(+), 6 deletions(-)

-- 
2.25.1

