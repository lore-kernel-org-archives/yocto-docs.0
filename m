Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.11661.1610558634336253667
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Jan 2021 09:23:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20150623.gappssmtp.com header.s=20150623 header.b=Gv21AIbF;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id t30so2990216wrb.0
        for <docs@lists.yoctoproject.org>; Wed, 13 Jan 2021 09:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B0P2XOsp91D7DAYMHzMYNk4BWv2xRPoGWkbJexy5luM=;
        b=Gv21AIbFYFDozQaNU97wg57fZDlvvb0PD1WanKDn8KTKj+RzQg59qewgUmhb1A+h2R
         2qBN+/tDJLBSFkr34XqT8vSkAmMClpGZHRruNOGs13laHXGOjbcSo+7QYYc8+C9Uq7G/
         zSc/pxeg2VE2sILYTqeX1rF+K1gWM9J3G9K0FtBrJn2rf97FKNC/gzZflyxe46NDqhbm
         GdQ86La7Lly7FrraE7lD4oqbHhcEU7I2O8eR7g9l9FVqnTTPE+S0VJcuxh29sA9bkLpi
         gQpPZ5j5BPlhXmvQjQ+gKUsMLMiLxCzBbR2SwD60acDlvYvJgrP0tnQ3eOZgdYeiwVg2
         DQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B0P2XOsp91D7DAYMHzMYNk4BWv2xRPoGWkbJexy5luM=;
        b=iSuFGZHzBbo0RjA3m2sOo42/KaeGtYKgOxFq/mVPEiLlGVkbhcusllmnywdNRY0R2N
         IOU99XRDIAjLnNyhr8GA/67vcFu+OnLevZ1wJbIlk0qcUB2OwBKAS0lZNOavm8YRjNiR
         6oWnu/LdVUMr0uzmt3ZUljX1PVOsnVY9GuPBJ//KaHOdx7sbCGo379giePJ66l+rG+gx
         D6wg8TG+Z9XjNUguEPL25hftasrY00v/abNXlLz+mb08KYiWEJ8T68jo9DMbcyHBipqR
         MJcrl6xSAcMjxq8K58j1M/7INs3+4jWmbAcx61rPXoStanheQcfXkK46ZjKcm6gKm1BN
         3B4w==
X-Gm-Message-State: AOAM531Igcbd6Xcs5u0ZDithA3lebBOcJrDNQs+5gwzrWFMxVOOmrZhz
	eoutfDJgAFyb/oLg/prxb/y+89ay2zXfMQ==
X-Google-Smtp-Source: ABdhPJzsw3bufZEaYwzW7GwiXPYIEW0qEweub83OI+8jU3YQPyI0cpHfHZUNhhxOEzlLpmCcnGbvPg==
X-Received: by 2002:a5d:6cc2:: with SMTP id c2mr3664121wrc.374.1610558632666;
        Wed, 13 Jan 2021 09:23:52 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost.localdomain (99.246.204.77.rev.sfr.net. [77.204.246.99])
        by smtp.gmail.com with ESMTPSA id p15sm4456316wrt.15.2021.01.13.09.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 09:23:52 -0800 (PST)
From: "Yoann Congal" <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] toaster-manual: Fix a warning related to the code-block directive
Date: Wed, 13 Jan 2021 18:23:29 +0100
Message-Id: <20210113172329.7683-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following warning by specifying the language (here : shell):
.../yocto/poky/documentation/toaster-manual/reference.rst:572: WARNING: Error in "code-block" directive:
1 argument(s) required, 0 supplied.

.. code-block::

   $ bitbake/lib/toaster/manage.py builddelete build_id

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 documentation/toaster-manual/reference.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/toaster-manual/reference.rst b/documentation/toaster-manual/reference.rst
index d2ab14c8e6..135968d40c 100644
--- a/documentation/toaster-manual/reference.rst
+++ b/documentation/toaster-manual/reference.rst
@@ -569,7 +569,7 @@ command would return something like the following::
 The ``builddelete`` command deletes data associated with a build. Access
 the command as follows:
 
-.. code-block::
+.. code-block:: shell
 
    $ bitbake/lib/toaster/manage.py builddelete build_id
 
-- 
2.20.1

