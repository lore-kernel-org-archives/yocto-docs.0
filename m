Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web08.34314.1605043763604019260
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Nov 2020 13:29:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G8fA3YYy;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id j14so168147ots.1
        for <docs@lists.yoctoproject.org>; Tue, 10 Nov 2020 13:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lOIU2QMRpfpneOpSJxVtgp+rz6eDaBOgTIBWGtiB41w=;
        b=G8fA3YYy4+yfQQyWrZvWeSrhJsS/GXAO+JVdwnyRD4CE/asuAk81+R3y63hZBd2Xxj
         L2WbWZElqNw+IjUYTD7puoTWq1uqQq6r8GTgDAwd9P8ffKIxY0sQPje5fwZggTPCa0/U
         Apo1sVK5HIndu9PjVvfoCXjdqvtVt9e+xiLVtOejEmeoL7GwJbG7o7O4/iQVLXCXvfcQ
         NuF2ocWgTunwHbdMw/dqXMYMV+R5mLYlhzXL1uSgA2MVJ4kJmdL5ku8uWs+G1ABfBKdX
         fviDigECelAHy8S1fXgTuWo6XFxZzOVdQA/PJKtPVJBjvb34vVd/APVoYDB2Sn6I6Hth
         +liw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lOIU2QMRpfpneOpSJxVtgp+rz6eDaBOgTIBWGtiB41w=;
        b=gO8JaRMLBZhAPN3daJ34xT8Gq50S83cKdC91zjBFgVhMl741fmKbV0ARB06BkzWUZc
         8Ta16E+3JJL4uNhso02/Z7+XCndqc2RW1mQhT1eDj6MSoBlDeGHIyg/WZusp6P06+N/p
         j4VFEVUNQ081S54tdlhm5RntA5AjeeppS2ViF6HfAEiTWs8wFNE25XhA1KexSUWygpCX
         vH5fmfeWehqrBH1oiPiZ5ZIfz8UC+O/yea+L5bKGOau3+mD7plkrTVClMvQkqExuPM0D
         vkiuVkDpxQV1Z28smeSd888eHxBwbdOvzznQyH+Lx902pQ5nzt+TC+aTGoPBSDkTftLr
         LY4w==
X-Gm-Message-State: AOAM532tm/oZE3PzJeX6+HYGUKwq/GILMWNw7Drtj9saunSGOvp6vbO3
	2UgwvO690w5I6IlnSsx3IFr2Y+qFUkNvSg==
X-Google-Smtp-Source: ABdhPJx5/frYhcvD0XhBPZeg2fUKA5HDfmasmuECqP05ekE46QoGg3jDP9tlhWFr3Su2wYj+cBfPlQ==
X-Received: by 2002:a05:6830:115a:: with SMTP id x26mr16302799otq.77.1605043761974;
        Tue, 10 Nov 2020 13:29:21 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id k13sm39532ooi.41.2020.11.10.13.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 13:29:21 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [docs][PATCH] documentation: Add Pipenv support
Date: Tue, 10 Nov 2020 15:29:17 -0600
Message-Id: <20201110212917.25172-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a Pipfile so that Pipenv can be used to automatically install all
the dependencies required to build the documentation

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 documentation/.gitignore |  1 +
 documentation/Pipfile    | 14 ++++++++++++++
 documentation/README     |  7 +++++++
 3 files changed, 22 insertions(+)
 create mode 100644 documentation/Pipfile

diff --git a/documentation/.gitignore b/documentation/.gitignore
index 69fa449dd..21bb72530 100644
--- a/documentation/.gitignore
+++ b/documentation/.gitignore
@@ -1 +1,2 @@
 _build/
+Pipfile.lock
diff --git a/documentation/Pipfile b/documentation/Pipfile
new file mode 100644
index 000000000..7ee1d2290
--- /dev/null
+++ b/documentation/Pipfile
@@ -0,0 +1,14 @@
+[[source]]
+name = "pypi"
+url = "https://pypi.org/simple"
+verify_ssl = true
+
+[dev-packages]
+
+[packages]
+sphinx = "*"
+sphinx-rtd-theme = "*"
+pyyaml = "*"
+
+[requires]
+python_version = "3"
diff --git a/documentation/README b/documentation/README
index 534ae66f8..28d5c4be8 100644
--- a/documentation/README
+++ b/documentation/README
@@ -127,6 +127,13 @@ The resulting HTML index page will be _build/html/index.html, and you
 can browse your own copy of the locally generated documentation with
 your browser.
 
+Alternatively, you can use Pipenv to automatically install all required
+dependencies in a virtual environment:
+
+ $ cd documentation
+ $ pipenv install
+ $ pipenv run make html
+
 Sphinx theme and CSS customization
 ==================================
 
-- 
2.29.2

