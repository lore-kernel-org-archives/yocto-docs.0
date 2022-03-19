Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB0A6C433FE
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 15:28:08 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web08.8293.1647703687535456580
 for <docs@lists.yoctoproject.org>;
 Sat, 19 Mar 2022 08:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EuNb9VPR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id
 v2-20020a7bcb42000000b0037b9d960079so8157406wmj.0
        for <docs@lists.yoctoproject.org>;
 Sat, 19 Mar 2022 08:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f3LR/J6q7xT4oQrmZJFZ6C024BrcdCzNS3xxm23JwYQ=;
        b=EuNb9VPRPz/mN+7elTE/gl7L9WnZBjNdzKg6ym0tkW21AP/sHpWLn2x1GQXJ4rA5AK
         Q8Dk1q+WnnwAnLiePMtEO0SAxHjDRhnWV3I0QxxAIkReZWlzK5sjLtTwbIiMGsEvTMWT
         HAmwcT/ztIbm+QONwz8ZSgUmD2E5tnFPtiZbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f3LR/J6q7xT4oQrmZJFZ6C024BrcdCzNS3xxm23JwYQ=;
        b=pTCkH1pxWpn3JQNz6ueEjsrKdBjGhaq/uqQ3DXqc+JHXylXCqBKCJJCuSH2MbcR1nw
         p4+SUA2ZY1PrKBb421wD2ze8TFAmkmotcsBhtuBU17jS0jNtm5NeCDmoAK2aQvKFER6i
         DfpSSzUZiMsaUtiP0Qy4TC8AkKGWgiNNWgt3suWVHnZA+72mmpLQRHaHDOAbsEzN+kpY
         7keaROT98h1D5hN9+PGPpsfDQGdXtYGBVLhJ/9ZEL34f+a0kAGalNg1nXIURly02qBrA
         AcQfv39lfj4Sj85nY5q5ZUn7TBFBQvfS36vXkp4TzhxnRY7zPlsw7qJXMC4rFuI7+vUU
         pjpQ==
X-Gm-Message-State: AOAM532uQ2IZAy0AEDrqiwkd5zARZPhBAR6WSqC92AZPbn3GmcLWTMd4
	0kgXVK86d9eaLhKnpmSq52GDyLxVSzvYKtLF
X-Google-Smtp-Source: 
 ABdhPJwvUdx9YHaJJB1XXB/lneZio+o6XBVz9IJietNbdyJ0AetAeGVl/NZslbca/Pt0qLm5U7JgMA==
X-Received: by 2002:a05:600c:3512:b0:38c:763e:480 with SMTP id
 h18-20020a05600c351200b0038c763e0480mr12580619wmq.81.1647703684774;
        Sat, 19 Mar 2022 08:28:04 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:3ad7:b7e1:8044:d0f5])
        by smtp.gmail.com with ESMTPSA id
 l126-20020a1c2584000000b00387d4f35651sm12659726wml.10.2022.03.19.08.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 08:28:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss+yocto@0leil.net>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/1][transition] Makefile: Use switchers generated from master
Date: Sat, 19 Mar 2022 15:28:01 +0000
Message-Id: <20220319152803.1110539-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 19 Mar 2022 15:28:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2644

This allows an improved and custmomised switcher for each release
showing the current doc version, the latest in that series and the
latest releases for the project overall.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/.gitignore                 |   1 +
 documentation/Makefile                   |   9 +-
 documentation/sphinx-static/switchers.js | 233 -----------------------
 3 files changed, 9 insertions(+), 234 deletions(-)
 delete mode 100644 documentation/sphinx-static/switchers.js

diff --git a/documentation/.gitignore b/documentation/.gitignore
index c1e43630d..f7d91141a 100644
--- a/documentation/.gitignore
+++ b/documentation/.gitignore
@@ -1,2 +1,3 @@
 _build/
 sphinx/__pycache__/
+sphinx-static/switchers.js
\ No newline at end of file
diff --git a/documentation/Makefile b/documentation/Makefile
index 564a906e2..433e880c4 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -8,9 +8,16 @@ TRANSITIONS   = $(sort $(patsubst $(SOURCEDIR)/transition/%/index.rst,%,$(wildca
 
 .PHONY: Makefile publish transition clean $(TRANSITIONS)
 
+sphinx-static/switchers.js.in:
+	git checkout master sphinx-static/switchers.js.in
+
+set_versions.py:
+	git checkout master set_versions.py
+
 transition: $(TRANSITIONS)
 
-$(TRANSITIONS):
+$(TRANSITIONS): sphinx-static/switchers.js.in set_versions.py
+	./set_versions.py $@
 	@$(SPHINXBUILD) -M html "$(SOURCEDIR)"/transition/$@/ "$(BUILDDIR)"/$@ $(SPHINXOPTS) $(O) -c "$(SOURCEDIR)"
 
 publish: transition
diff --git a/documentation/sphinx-static/switchers.js b/documentation/sphinx-static/switchers.js
deleted file mode 100644
index e52032ead..000000000
--- a/documentation/sphinx-static/switchers.js
+++ /dev/null
@@ -1,233 +0,0 @@
-(function() {
-  'use strict';
-
-  var all_versions = {
-    'dev': 'dev (3.2)',
-    '3.1.4': '3.1.4',
-    '3.0.4': '3.0.4',
-    '2.7.4': '2.7.4',
-  };
-
-  var all_doctypes = {
-      'single': 'Individual Webpages',
-      'mega': "All-in-one 'Mega' Manual",
-  };
-
-  // Simple version comparision
-  // Return 1 if a > b
-  // Return -1 if a < b
-  // Return 0 if a == b
-  function ver_compare(a, b) {
-    if (a == "dev") {
-       return 1;
-    }
-
-    if (a === b) {
-       return 0;
-    }
-
-    var a_components = a.split(".");
-    var b_components = b.split(".");
-
-    var len = Math.min(a_components.length, b_components.length);
-
-    // loop while the components are equal
-    for (var i = 0; i < len; i++) {
-        // A bigger than B
-        if (parseInt(a_components[i]) > parseInt(b_components[i])) {
-            return 1;
-        }
-
-        // B bigger than A
-        if (parseInt(a_components[i]) < parseInt(b_components[i])) {
-            return -1;
-        }
-    }
-
-    // If one's a prefix of the other, the longer one is greater.
-    if (a_components.length > b_components.length) {
-        return 1;
-    }
-
-    if (a_components.length < b_components.length) {
-        return -1;
-    }
-
-    // Otherwise they are the same.
-    return 0;
-  }
-
-  function build_version_select(current_series, current_version) {
-    var buf = ['<select>'];
-
-    $.each(all_versions, function(version, title) {
-      var series = version.substr(0, 3);
-      if (series == current_series) {
-        if (version == current_version)
-            buf.push('<option value="' + version + '" selected="selected">' + title + '</option>');
-        else
-            buf.push('<option value="' + version + '">' + title + '</option>');
-
-        if (version != current_version)
-            buf.push('<option value="' + current_version + '" selected="selected">' + current_version + '</option>');
-      } else {
-        buf.push('<option value="' + version + '">' + title + '</option>');
-      }
-    });
-
-    buf.push('</select>');
-    return buf.join('');
-  }
-
-  function build_doctype_select(current_doctype) {
-    var buf = ['<select>'];
-
-    $.each(all_doctypes, function(doctype, title) {
-      if (doctype == current_doctype)
-        buf.push('<option value="' + doctype + '" selected="selected">' +
-                 all_doctypes[current_doctype] + '</option>');
-      else
-        buf.push('<option value="' + doctype + '">' + title + '</option>');
-    });
-    if (!(current_doctype in all_doctypes)) {
-        // In case we're browsing a doctype that is not yet in all_doctypes.
-        buf.push('<option value="' + current_doctype + '" selected="selected">' +
-                 current_doctype + '</option>');
-        all_doctypes[current_doctype] = current_doctype;
-    }
-    buf.push('</select>');
-    return buf.join('');
-  }
-
-  function navigate_to_first_existing(urls) {
-    // Navigate to the first existing URL in urls.
-    var url = urls.shift();
-
-    // Web browsers won't redirect file:// urls to file urls using ajax but
-    // its useful for local testing
-    if (url.startsWith("file://")) {
-      window.location.href = url;
-      return;
-    }
-
-    if (urls.length == 0) {
-      window.location.href = url;
-      return;
-    }
-    $.ajax({
-      url: url,
-      success: function() {
-        window.location.href = url;
-      },
-      error: function() {
-        navigate_to_first_existing(urls);
-      }
-    });
-  }
-
-  function get_docroot_url() {
-    var url = window.location.href;
-    var root = DOCUMENTATION_OPTIONS.URL_ROOT;
-
-    var urlarray = url.split('/');
-    // Trim off anything after '/'
-    urlarray.pop();
-    var depth = (root.match(/\.\.\//g) || []).length;
-    for (var i = 0; i < depth; i++) {
-      urlarray.pop();
-    }
-
-    return urlarray.join('/') + '/';
-  }
-
-  function on_version_switch() {
-    var selected_version = $(this).children('option:selected').attr('value');
-    var url = window.location.href;
-    var current_version = DOCUMENTATION_OPTIONS.VERSION;
-    var docroot = get_docroot_url()
-
-    var new_versionpath = selected_version + '/';
-    if (selected_version == "dev")
-        new_versionpath = '';
-
-    // dev versions have no version prefix
-    if (current_version == "dev") {
-        var new_url = docroot + new_versionpath + url.replace(docroot, "");
-        var fallback_url = docroot + new_versionpath;
-    } else {
-        var new_url = url.replace('/' + current_version + '/', '/' + new_versionpath);
-        var fallback_url = new_url.replace(url.replace(docroot, ""), "");
-    }
-
-    console.log(get_docroot_url())
-    console.log(url + " to url " + new_url);
-    console.log(url + " to fallback " + fallback_url);
-
-    if (new_url != url) {
-      navigate_to_first_existing([
-        new_url,
-        fallback_url,
-        'https://www.yoctoproject.org/docs/',
-      ]);
-    }
-  }
-
-  function on_doctype_switch() {
-    var selected_doctype = $(this).children('option:selected').attr('value');
-    var url = window.location.href;
-    if (selected_doctype == 'mega') {
-      var docroot = get_docroot_url()
-      var current_version = DOCUMENTATION_OPTIONS.VERSION;
-      // Assume manuals before 3.2 are using old docbook mega-manual
-      if (ver_compare(current_version, "3.2") < 0) {
-        var new_url = docroot + "mega-manual/mega-manual.html";
-      } else {
-        var new_url = docroot + "singleindex.html";
-      }
-    } else {
-      var new_url = url.replace("singleindex.html", "index.html")
-    }
-
-    if (new_url != url) {
-      navigate_to_first_existing([
-        new_url,
-        'https://www.yoctoproject.org/docs/',
-      ]);
-    }
-  }
-
-  // Returns the current doctype based upon the url
-  function doctype_segment_from_url(url) {
-    if (url.includes("singleindex") || url.includes("mega-manual"))
-      return "mega";
-    return "single";
-  }
-
-  $(document).ready(function() {
-    var release = DOCUMENTATION_OPTIONS.VERSION;
-    var current_doctype = doctype_segment_from_url(window.location.href);
-    var current_series = release.substr(0, 3);
-    var version_select = build_version_select(current_series, release);
-
-    $('.version_switcher_placeholder').html(version_select);
-    $('.version_switcher_placeholder select').bind('change', on_version_switch);
-
-    var doctype_select = build_doctype_select(current_doctype);
-
-    $('.doctype_switcher_placeholder').html(doctype_select);
-    $('.doctype_switcher_placeholder select').bind('change', on_doctype_switch);
-
-    if (ver_compare(release, "3.1") < 0) {
-      $('#outdated-warning').html('Version ' + release + ' of the project is now considered obsolete, please select and use a more recent version');
-      $('#outdated-warning').css('padding', '.5em');
-    } else if (release != "dev") {
-      $.each(all_versions, function(version, title) {
-        var series = version.substr(0, 3);
-        if (series == current_series && version != release) {
-          $('#outdated-warning').html('This document is for outdated version ' + release + ', you should select the latest release version in this series, ' + version + '.');
-          $('#outdated-warning').css('padding', '.5em');
-        }
-      });
-    }
-  });
-})();
-- 
2.32.0


