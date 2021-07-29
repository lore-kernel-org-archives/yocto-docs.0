Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.16086.1627596588832766788
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jul 2021 15:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TzAxeCwq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id u15-20020a05600c19cfb02902501bdb23cdso7810990wmq.0
        for <docs@lists.yoctoproject.org>; Thu, 29 Jul 2021 15:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CEdzgAMdPGH56BEt6j3qO1FVMsIVSJagSp/N6UCEhvU=;
        b=TzAxeCwq4cFDckuccWM0fgK0hzOxVGV2fLaWjNNvpnXNYSq96pQ0ehjRrO5nZJly4V
         2caiirUjNwuF7JmtEkBo6qFjT2uyILXUoyNOuBr7ESQecBDzMgnmlyNDCPivIxc9XGr0
         vO7TmqJzOcguVtXiCjmesZGvWSSCaKzhe4lRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CEdzgAMdPGH56BEt6j3qO1FVMsIVSJagSp/N6UCEhvU=;
        b=E2/J+K7YYnQPV2wRQtseIK4OPOX1Z3sTv36Ub2SVVIi//HfS/Tvrg3UZm6phj8CBPy
         Aen4Vm9vyd1ggCEi4/9MEksUmVNEbPgSD2CqRUKCaq+iUsoZkYADCHN+fscijwz2tZVH
         tpfdNtb+CPl9BE9qKs84TWzph/ynBJ6SNrZ3AsLFxgRByjmDQgoJg7Ro+/bMU08KCir4
         1t8jXHiqMgVwcW8PWxZ6cL9bTXrNRdvtXQOQxQxn3OWI/7RDLJvXkgkZv3D44eFDz97I
         yB65tbXdPboo3EyGBx5/FyAMwPzAIOgFAmSokjioJXG7grvqJB/jFqqOLL5VATFA1pG+
         Xo3A==
X-Gm-Message-State: AOAM532YYuznyl3XQa/YhImcP3Xggg0GkQXMz5qoq/npz6RjJxKi9o3n
	cF1XSyibfIJkP24GTqqJwPh5PGlySDkwig==
X-Google-Smtp-Source: ABdhPJyUsXo//sKoUm7T1i9v2QkQsDKl/dsIPTNd1RZs02QTQrIL7jEjZ91NTmsypblLu+AYtfdXiQ==
X-Received: by 2002:a1c:7314:: with SMTP id d20mr6726733wmb.167.1627596586773;
        Thu, 29 Jul 2021 15:09:46 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:47e7:2d3d:e4c2:218b])
        by smtp.gmail.com with ESMTPSA id p3sm10876769wmp.25.2021.07.29.15.09.46
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 15:09:46 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] migration-guides: Add start of 3.4 guide with override migration notes
Date: Thu, 29 Jul 2021 23:09:45 +0100
Message-Id: <20210729220945.3333837-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/migration-guides/index.rst      |  1 +
 .../migration-guides/migration-3.4.rst        | 72 +++++++++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 documentation/migration-guides/migration-3.4.rst

diff --git a/documentation/migration-guides/index.rst b/documentation/migration-guides/index.rst
index 6304e6318..287b55319 100644
--- a/documentation/migration-guides/index.rst
+++ b/documentation/migration-guides/index.rst
@@ -12,6 +12,7 @@ to move to one release of the Yocto Project from the previous one.
 .. toctree::
 
    migration-general
+   migration-3.4
    migration-3.3
    migration-3.2
    migration-3.1
diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
new file mode 100644
index 000000000..45ce38cd6
--- /dev/null
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -0,0 +1,72 @@
+Release 3.4 (honister)
+======================
+
+This section provides migration information for moving to the Yocto
+Project 3.4 Release (codename "honister") from the prior release.
+
+Override syntax changes
+-----------------------
+
+This release requires changes to the metadata to indicate where overrides are
+being used in variable key names. This is done with the ":" character replacing
+the use of "_" previously. This means that an entry like::
+
+   SRC_URI_qemux86 = "file://somefile"
+
+becomes::
+
+   SRC_URI:qemux86 = " file://somefile"
+
+since qemux86 is an override. This applies to any use of override syntax so::
+
+   SRC_URI_append = " file://somefile"
+   SRC_URI_append_qemux86 = " file://somefile2"
+   SRC_URI_remove_qemux86-64 = " file://somefile3"
+   SRC_URI_prepend_qemuarm = "file://somefile4 "
+   FILES_${PN}-ptest = "${bindir}/xyz"
+   IMAGE_CMD_tar = "tar"
+   BASE_LIB_tune-coretexa76 = "lib"
+   SRCREV_pn-bash = "abc"
+   BB_TASK_NICE_LEVEL_task-testimage = '0'
+
+becomes::
+
+   SRC_URI:append = " file://somefile"
+   SRC_URI:append:qemux86 = " file://somefile2"
+   SRC_URI:remove:qemux86-64 = " file://somefile3"
+   SRC_URI:prepend:qemuarm = "file://somefile4 "
+   FILES:${PN}-ptest = "${bindir}/xyz"
+   IMAGE_CMD:tar = "tar"
+   BASE_LIB:tune-coretexa76 = "lib"
+   SRCREV:pn-bash = "abc"
+   BB_TASK_NICE_LEVEL:task-testimage = '0'
+
+This also applies to variable queries to the datastore, for example using getVar 
+and similar so d.getVar("RDEPENDS_${PN}") becomes d.getVar("RDEPENDS:${PN}").
+
+Whilst some of these are fairly obvious such as MACHINE and DISTRO overrides, some
+are less obvious, for example the packaging variables such as RDEPENDS, FILES and 
+so on taking package names (e.g. ${PN}, ${PN}-ptest) as overrides. These overrides 
+are not always applies in OVERRIDES but applied conditionally in specific contexts
+such as packaging. The task-<taskname> is another context specific override, the 
+context being specific tasks in that case. Tune overrides are another specialist
+case where some code does use them as overrides but some does not. We plan to try
+and make the tune code use overrides more consistently in the future.
+
+To help with migration of layers there is a script in OE-Core. Once configured
+with the overrides used by a layer, this can be run as::
+
+   <oe-core>/scripts/contrib/convert-overrides.py <layerdir>
+
+Please read the notes in the script as it isn't entirely automatic and it isn't
+expected to handle every case. In particular, it needs to be told which overrides
+the layer uses (usually machine and distro names/overrides) and the result should
+be carefully checked since it can be a little enthusiastic and will convert
+references to "_append", "_remove" and "_prepend" in function and variables names.
+
+For reference, this conversion is important as it allows bitbake to know what is
+an override and what is not. This should allow us to proceed with other syntax
+improvements and simplifications for usability. It also means bitbake no longer
+has to guess and maintain large lookup lists just in case "functionname" in
+"my_functionname" is an override and this should improve efficiency.
+
-- 
2.30.2

