Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4CBCC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 14:33:38 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web08.8430.1646750017930397259
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 06:33:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ogF1d0SY;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id k92so8237549pjh.5
        for <docs@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 06:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2DAvA7rC8+SWzhHBZqvz1RsRxmeZrohhCnEsj421nxY=;
        b=ogF1d0SY1B/b77cVKQA8ytnlhTgCxgCT2aM3gRfXVuY9u98ShtSZX+nRMYSaEZx5Po
         w3tnEPX6fe88jq7yxKNG8HUdysbhKWbqeQ6yVHyIHW7xvXMzJIhJ80ovPaa8RqtQX0FH
         Z/VjJ0lWzIAVPYrr0O3cEQ39lwv6aESnr40sHXi9gI8gMVO28VpR/eaE59tBCzIEWGOa
         5pgBw2ECjhhz+Sf4vKJX/1oIzs6xYG1rOxtnStzCMJ0TNX+c+h3uH1wa8bFxyrdHqlwm
         jiSpi2q1p39TBEKNnx1qZ3gnsQDD9h0N0IWJLg6PXmJOstYl4rA00OVDulgZQaixOJlp
         0APQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2DAvA7rC8+SWzhHBZqvz1RsRxmeZrohhCnEsj421nxY=;
        b=TE9gu3VfYC/ye52jRDwJRaV4dZt9arYFdR4efOZfQnGOh8nKEYRDcbsmwQrt3AtyPH
         C4aP2bL7vtg6w3bRVpC+8/d+W1ZyW9iIstM3/bBCIa5ajnNId9mHqpDibREhWcBXeawz
         w16aHD3uF6sExAj7ijKYSfj+mgTuv/Bn0zFaZ1VQuOKE5AHADdO30RvpxD0FCeiuLKcJ
         8qvnDf1c9Hx9JoR/wW61lI8b80m52uAwWMWGbqy3EFWE6x/BOqbdppplTXjx8P8tbYB8
         X5u3uPbfF0H6vVwNoBz2K936/4jVEFQ+Bo/hIDRZLtdAzfWbttcZka444vJrenQ+o+Mm
         GrOA==
X-Gm-Message-State: AOAM530GME9IcvE+fRU2h5rLja4rNJdRfVIVurdV39uk85CV5eMHuP2e
	iuIzkyGctga3evKWU31Yp+WnfeJOChDruQJX8RQ=
X-Google-Smtp-Source: 
 ABdhPJwJ4KBaQApaXqxzaeXZrxaMUIZbjnmmFcBOcFQtfmZajG5qHqqgsbbV2CXS7HJRzsfNi/k7Cg==
X-Received: by 2002:a17:902:a508:b0:14d:bfd8:58be with SMTP id
 s8-20020a170902a50800b0014dbfd858bemr18211597plq.10.1646750016843;
        Tue, 08 Mar 2022 06:33:36 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 q14-20020a056a00150e00b004f741b5c071sm687361pfu.86.2022.03.08.06.33.35
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 06:33:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 0/2] Patch review
Date: Tue,  8 Mar 2022 04:33:26 -1000
Message-Id: <cover.1646749913.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Mar 2022 14:33:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2544

Please review this set of patches for dunfell.

The following changes since commit 1617120ac3a8fd0af1ba42319198f1677de4596e:

  documentation: update for 3.1.14 release (2022-02-17 16:12:24 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs contrib/dunfell-next
  http://git.yoctoproject.org/cgit.cgi/yocto-docs/log/?h=contrib/dunfell-next

Steve Sakoman (2):
  ref-system-requirements.rst: update list of supported distros
  documentation: update for 3.1.15 release

 documentation/conf.py                                | 2 +-
 documentation/poky.yaml                              | 8 ++++----
 documentation/ref-manual/ref-system-requirements.rst | 5 +++++
 3 files changed, 10 insertions(+), 5 deletions(-)

-- 
2.25.1


