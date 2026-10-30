Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2544.1793401333049382778
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Oct 2026 16:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T7Z/XHAl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso10996255e9.1
        for <docs@lists.yoctoproject.org>; Fri, 30 Oct 2026 16:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793401331; x=1794006131; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fqV7lmGWoaanwOpebzUGZmlLtF2S8m6C6jpq5cVIUzA=;
        b=T7Z/XHAlA3eyiT4QG+fPkomEdIEZgo1qtsN8caqvhCNek4e6OSXJZqCZwztTY7NXrM
         OYxJyACSL4gEAifcbZm1xQTV52DEb03JxadJR8pul3zWJBkIEppGuov7d96i3vstWYHw
         Er0m45fQkAFrqS8kekJac8BX5jNQK2FoL17r4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793401331; x=1794006131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fqV7lmGWoaanwOpebzUGZmlLtF2S8m6C6jpq5cVIUzA=;
        b=q+HOA7z1LwxEvccsBYp566v/kKVumLrGTHk7b6Ts6aNw/TKJVwhe/MMbGWAQKDic+5
         TD1vHi9CXuimMmytnRsH6pKLbWXjrpNUDa+X2w9c5ppL8dSj+Hc2OK6JB85FmTR+KwgH
         X5qgsn9HYe4wHk+2NcpPwf8s2natUtR7y+cF5P7RSHYe5Ym6X6zABahVv3WYZQ2spcsW
         cebVIDY9D21lZd7F90m6XAb0prxmPCrXc0sgY2uv7pyNvIk0MWA1DzMAtC3T46HqJa5E
         Nko/IHTXo8NCxixDJU5xebNWNmesmNdsRN0XISFLmfF8wovk3zXJkwKpUcP3LfNq/5gy
         RJHw==
X-Gm-Message-State: AFq9FYIin5xhvx6SIOuqEYnLwv7GXnNrmNzlhHTVac9A1DMKpq2W2gzp
	PDVGo/OXEMqiukpDnW25N/gvr8Et2fHMuSNDibCAM4jEnVzD/7DocUVRAMKc5v/O2k+utedHWjb
	2RFzlkiE=
X-Gm-Gg: AYBFou0bCeftB1zFM/o40VS8fSi4aVKSo0QupBjXhcj020PSaMkMvHXulY3I1L8i4hq
	WLJ7sQqZwyrfwEUPabsoDwwzg9Zt3qAsBv7RCX9E2Mmxsn+rZX4d1BEXI7giA6e3WOxud4xK18E
	6SzaJKr+XZK6fzYM0+9RxP1fXI6VZzBZ9XaaVkCHcJSwqVels06W8EwH2HJHGRDccuJoOT+bsqi
	pjUNqDkJa8zj78PUQAiSnFC6dSMXgQJVD/x6kFwl9bCYQOPRL0sn+RV/wXViUDTVIRyezK67Vhe
	G18WZ8tYVie6ojDap6tiHbFAc6mFafSHM14ubF5OoOsfPpdNH+EbaMqmBgrhDFHyFc8H9+tpqY2
	djO4iZhJodjjgajWy62DqqtUtnnbtdOptMp18xnHF0dm1jLjEdl4BepFZx3saYVNwO4u0zIxIoX
	N9N4ZUcd8FFieNx/H2oF5QHpys+yDvWOZS+UoGQ/UvJwtXcn8AQT+E4Kl+x/EabmhdFy/e7jKXT
	2wQQOSZLnNZwgPLs148nECConn6gCnmoytBPZs0DlSTJdBnmnVva+ovYi1pYdn2nxGFQX/HTDBf
	gCybFUA8H2cw4bpklkw0FmTsmyKYu+BsuxvM46Kq2l4i8IvW1QmddFJDBw==
X-Received: by 2002:a05:600c:354a:b0:4a3:5aee:2c25 with SMTP id 5b1f17b1804b1-4ac181e759dmr88632745e9.31.1793401330946;
        Fri, 30 Oct 2026 16:02:10 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:50a1:2666:faf3:9570])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09cc3e9asm36354205e9.3.2026.10.30.16.02.08
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 16:02:08 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH v3] ref-manual/faq: Add entry about emails on patch merging
Date: Fri, 30 Oct 2026 23:02:07 +0000
Message-ID: <20261030230207.3536573-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 30 Oct 2026 23:02:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10751
Content-Type: text/plain; charset="utf-8"

Document why we don't currently send emails when patches merge in the FAQ.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/ref-manual/faq.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 3646286a6..c1657d677 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -88,6 +88,26 @@ Our automated testing includes it through the ``poky-altcfg`` :term:`DISTRO` and
 we don't really need it to be the default: it is tested, it works, and people
 can choose to use it.
 
+Why don't I get an email when my patch merges?
+----------------------------------------------
+
+Where the project uses mailing lists for patch submission, many of the components
+such as bitbake and OpenEmbedded-Core haven't found it appropriate to reply on the
+mailing list for each patch that merges for two main reasons. Firstly, it would
+generate a lot of email traffic with content that may only be useful to a small
+number of people and quite annoying for other uninterested people to filter through.
+That could be avoided by only sending emails direct to the submitters.
+
+Secondly, sending such emails accurately, takes time and it wasn't felt to be the
+best use of limited maintainer time. We do track patch status to some level
+in patchwork and there is automated tooling which could extend on top of that but
+it hasn't been possible to fit that into the projects workflows with enough accuracy
+at this time.
+
+It is very easy to check whether a patch has merged by looking at the repository, or
+pulling and rebasing.
+
+
 Building environment
 ====================
 
