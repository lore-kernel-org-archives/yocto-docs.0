Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.19935.1621262548479167623
 for <docs@lists.yoctoproject.org>;
 Mon, 17 May 2021 07:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mdN1W+UK;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id m124so4771840pgm.13
        for <docs@lists.yoctoproject.org>; Mon, 17 May 2021 07:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JfGDc8kU+2DcrdgOU8yhVsH1wLPqEc7QjFdWd2aMsNU=;
        b=mdN1W+UKHdpahh4FpmzeuJevrimLaAtNpEoXaCxCzRoYYXWbfgiwISwEqKgRT3VN9F
         riXq5oiNMHOD3mT3zNOxY3rB5zPYjvqKdLbTlzwmNKRM8E7lgbPYPU+HSgR2x3b3A+fv
         4sK5jF65GS4QK48Q4cnEmusNQT7IEYCdRzeHrxyQgbPjP+P6HB4pdKQNNrNhGI15+vG1
         XcAAGl9htl9c777UcHHqY/HNUhaX3p2XIau0eAQlX77p0QN611T9RnljBk0nrobCHcFU
         t5GZLN33fSXPmXENtgSpTtUc1TkqwRUEiC85kElO2SaBKL9m3tol0nIVRjmrRQuLdZfr
         JpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JfGDc8kU+2DcrdgOU8yhVsH1wLPqEc7QjFdWd2aMsNU=;
        b=W7XHi0P/ZLAgobHof3NgnGVfMeAjnsQQl2YCY2svhqeA73z60BIIdJqbG9OyjsD8nz
         vGhxnz8mjO6kd26GvRN9oYDh7EWiuvPpOu64K48eAcEzqvoxv+AK4+nmwzuZxNLPpVWP
         RnMeRtlhjtniFZtc9RG5JyOnOCOPEdz9N2tIMZxC/1mEjYC/ZmVpuAV54V5GTCFSjHol
         Vk0HlfRBK5rYcs0feKi0s0sTH80xttVxsKBNpkObX5Aqewvj5pw8l4Gcy2EAMI0+extt
         yajF7D3Pi+U4Nsz52SeHAElwnWlTFjA25b1KvZ3IfkF/PW+9Vlcoa4mF7fBFaS6GRjfM
         1RFQ==
X-Gm-Message-State: AOAM5322AVnrqPnJLQ2JaoGawvYRhvU7VLMYmZ8v++Jcm2Q0IkQ9JVwJ
	zrbf1YHQqnPSxANKYkQTWQkUqRWEsLTxTg/vzWY=
X-Google-Smtp-Source: ABdhPJwDd2FGSLJKLoCShZMZz73aamG4FGN7U/W8jC8KtQfgvzGB3btuFZd7oEPYeY0hTP3nDgP3DA==
X-Received: by 2002:a65:6a44:: with SMTP id o4mr8076937pgu.145.1621262547574;
        Mon, 17 May 2021 07:42:27 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y64sm9908138pfy.204.2021.05.17.07.42.26
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:42:27 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 1/2] ref-system-requirements.rst: Add Fedora 33 to list of supported distros
Date: Mon, 17 May 2021 04:42:11 -1000
Message-Id: <07669400a5affa6bc19a5bfdea9ebc05db0b07e3.1621262110.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621262110.git.steve@sakoman.com>
References: <cover.1621262110.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/ref-manual/ref-system-requirements.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
index 65234d072..bb688772f 100644
--- a/documentation/ref-manual/ref-system-requirements.rst
+++ b/documentation/ref-manual/ref-system-requirements.rst
@@ -55,6 +55,8 @@ distributions:
 
 -  Fedora 32
 
+-  Fedora 33
+
 -  CentOS 7.x
 
 -  Debian GNU/Linux 8.x (Jessie)
-- 
2.25.1

