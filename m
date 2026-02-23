Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D7EEA4FA0
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 10:58:14 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32953.1771844284151859373
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 02:58:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=JopnmGXS;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9A48A4E41031
	for <docs@lists.yoctoproject.org>; Mon, 23 Feb 2026 10:58:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 716975FD43
	for <docs@lists.yoctoproject.org>; Mon, 23 Feb 2026 10:58:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C579910368F7D;
	Mon, 23 Feb 2026 11:58:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771844282; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Rv3CKnjpcIcydRV/cZm9PAvWkvE39II2OXqKQRUgiUk=;
	b=JopnmGXSK0Kz4G4G8HBAraTisa2Vl+OYe3iOTx1aaewrUdJMgk/FAcfHpgYC9vsnjKZGZ+
	leMyyFL6EdNpR1UMfaj3vd+RjV9POSn72pR/elA+2KZKaTdl4M7G863MYpuRWV72ba8Ptt
	Imz/QZYYN3WZwGNIfUY8l//F3BG0/X+WYY6RYzdd9FOvogcAfnpbAfzJ/srIKMT+KV2BlZ
	+pkt+KwbII7VhWIInMFEEx/dKNI1ruwnsifryMgDLayB7LcUo2C6XIlvN99BLtDwwf4Qkt
	d1YbAigTC5/wGJkGzUcK8QvqQllaa3WZ2oSDBBRnNguX4AImH+jOHjsrwlzqqw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 23 Feb 2026 11:57:52 +0100
Subject: [PATCH v2 2/4] switchers.js: rework the logic and improve it
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-fix-switchers-js-v2-2-296523996600@bootlin.com>
References: <20260223-fix-switchers-js-v2-0-296523996600@bootlin.com>
In-Reply-To: <20260223-fix-switchers-js-v2-0-296523996600@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=20642;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=/W9b3jdfOOd0lE9uLs1lhE0rRIy9q/ht+nwLH4L+hd4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpnDK2pLIUVutUdAEzVP6qKRYRbkpW/0JDHEbwR
 G677SVxXlGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaZwytgAKCRDRgEFAKaOo
 NrIJD/9RnMyjmnPb9OpYnXR2hEGGzxtgM11G/4Mmw22SrltZTDatExFA4DCUojbMGfv/l8a8y+z
 ZxOJznwsqBsPXE0+pWA5J7EfF2Lgb13lRle3k8QvRw0Te+J9xg5vd73Up7Uyqdy2LZbuLd8yIvk
 PEFVgxnItjHgUTPb8bI2GqaT46ziij7srrVb+JwSU0Hogrp7XBWPN58Wspa0ckfxWDGfcF4QD7Q
 du2CiV/rByQQ3/Tjb79/pIkh8aM/bkUIYMHDbk61AhVB/TY+g7cIWIgh5FvWYqS/gZ00ONDI1/c
 pNFScvtUC66Y63XG3eUMQGHC0SMmmM0mG9h9nohyZYFRKuH7Md8h7g5wBG3aSuAOYgU6HJKBJ4W
 oXsmULhIPLpsjORxgQ1UKnXYAL3TPD+SA545g4LOQAdY8za3UOCN6u1IEv3PXjZ4xkbmL8ojRhf
 G41cb8Uh1ecp84HUA5oGk6QCry5jJE2ylO1wx4GvSV63uUQ8HD1zJP7O9REggFDUQrWHoMdTpOA
 ahTlnhwOc9IVb337B+ZhnCSGojAlFIMzELDrRueFAwtpMKagZMCNMyUTQGrPTBstiZZ9hZs9WTA
 vu0w+eKlrx0Gj2896tqgOiz4qMZ9PDb8/DuygUKx1sjuEEv89kwQh56/TMulfypewJ2MOHTp5ws
 uINZcFp1uk03cKQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Feb 2026 10:58:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8953

Rework the generation of the switcher menu, and also fix it. It's not
obvious how this could be split for easier review, as many parts depend on
one another, so this is what this patch changes and fixes:

- The menu only contains branch tips versions of the documentation for
  supported releases now - even though the latest tag is displayed in
  the menu.

  This approach will fix the lack of release notes for the latest
  version of an active branch, as release notes are always published
  after the yocto-docs repository is tagged.

- Show a commit id when building on a separate commit that is not a
  branch tip or not a tag. This should only ever happen when building
  locally (not for the published version).

- All stable/LTS versions are displayed in the menu UNLESS the current
  version for which we are viewing is part of them, in which case it's
  shown last in the menu.

- Rework the logic to show outdated or obsolete versions to conform with
  the above changes, but overall it behaves the same:

  - granted that Kirkstone is an active release, and 4.0.32 is the
    latest tag for this release, the "outdated" banner is displayed if
    we browse any version of Kirkstone inferior to 4.0.32.

  - browsing any version not part of the active releases (all LTS
    versions + the stable branch) will show the "obsolete" banner.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/set_versions.py               | 152 +++++++++++++++-------------
 documentation/sphinx-static/switchers.js.in | 137 +++++++++++++++++--------
 2 files changed, 177 insertions(+), 112 deletions(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index 1c7f5fb70..fedbad00e 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -16,7 +16,6 @@ import collections
 import sys
 import os
 import itertools
-import re
 
 # Order matters: most recent to least recent
 activereleases = ["whinlatter", "scarthgap", "kirkstone"]
@@ -94,6 +93,8 @@ ourseries = None
 ourbranch = None
 bitbakeversion = None
 docconfver = None
+head_commit = None
+is_branch_tip = False
 
 # Test that we are building from a Git repository
 try:
@@ -114,29 +115,30 @@ tags = subprocess.run(["git", "tag", "--points-at", "HEAD"], stdout=subprocess.P
 for t in tags.split():
     if t.startswith("yocto-"):
         ourversion = t[6:]
-
-if ourversion:
-    # We're a tagged release
-    components = ourversion.split(".")
-    baseversion = components[0] + "." + components[1]
-    docconfver = ourversion
-    for i in release_series:
-        if release_series[i] == baseversion:
-            ourseries = i
-            ourbranch = i
-            if i in bitbake_mapping:
-                bitbakeversion = bitbake_mapping[i]
-else:
+        seriesversion = ".".join(ourversion.split(".")[0:2])
+        for series in release_series:
+            if release_series[series] == seriesversion:
+                ourseries = series
+                bitbakeversion = bitbake_mapping[ourseries]
+                break
+        break
+
+if ourversion is None:
     # We're floating on a branch
-    branch = subprocess.run(["git", "branch", "--show-current"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True).stdout.strip()
-    ourbranch = branch
-    if branch != "master" and branch not in release_series:
-        # We're not on a known release branch so we have to guess. Compare the numbers of commits
-        # from each release branch and assume the smallest number of commits is the one we're based off
+    branch = subprocess.run(["git", "branch", "--show-current"],
+                            stdout=subprocess.PIPE, stderr=subprocess.PIPE,
+                            universal_newlines=True).stdout.strip()
+
+    if branch == "" or branch not in list(release_series.keys()) + ["master", "master-next"]:
+        # We're not on a known release branch so we have to guess. Compare the
+        # numbers of commits from each release branch and assume the smallest
+        # number of commits is the one we're based off
         possible_branch = None
         branch_count = 0
         for b in itertools.chain(release_series.keys(), ["master"]):
-            result = subprocess.run(["git", "log", "--format=oneline",  "HEAD..origin/" + b], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
+            result = subprocess.run(["git", "log", "--format=oneline", "HEAD..origin/" + b],
+                                    stdout=subprocess.PIPE, stderr=subprocess.PIPE,
+                                    universal_newlines=True)
             if result.returncode == 0:
                 count = result.stdout.count('\n')
                 if not possible_branch or count < branch_count:
@@ -148,29 +150,30 @@ else:
         else:
             branch = "master"
         print("Nearest release branch estimated to be %s" % branch)
+
     if branch == "master":
+        ourversion = "dev"
         ourseries = devbranch
-        docconfver = "dev"
-        bitbakeversion = "dev"
-    elif branch in release_series:
-        ourseries = branch
-        if branch in bitbake_mapping:
-            bitbakeversion = bitbake_mapping[branch]
-    else:
-        sys.exit("Unknown series for branch %s" % branch)
-
-    previoustags = subprocess.run(["git", "tag", "--merged", "HEAD"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True).stdout
-    previoustags = [t[6:] for t in previoustags.split() if t.startswith("yocto-" + release_series[ourseries])]
-    futuretags = subprocess.run(["git", "tag", "--merged", ourbranch], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True).stdout
-    futuretags = [t[6:] for t in futuretags.split() if t.startswith("yocto-" + release_series[ourseries])]
-
-    # Append .999 against the last known version
-    if len(previoustags) != len(futuretags):
-        ourversion = previoustags[-1] + ".999"
+        bitbakeversion = ourversion
+    elif branch == "master-next":
+        ourversion = "next"
+        ourseries = devbranch
+        bitbakeversion = ourversion
     else:
-        ourversion = release_series[ourseries] + ".999"
-    if not docconfver:
-        docconfver = ourversion
+        ourseries = branch
+        bitbakeversion = bitbake_mapping[ourseries]
+        ourversion = release_series[branch]
+        head_commit = subprocess.run(["git", "rev-parse", "--short", "HEAD"],
+                                     stdout=subprocess.PIPE, stderr=subprocess.PIPE,
+                                     universal_newlines=True).stdout.strip()
+        branch_commit = subprocess.run(["git", "rev-parse", "--short", branch],
+                                        stdout=subprocess.PIPE, stderr=subprocess.PIPE,
+                                        universal_newlines=True).stdout.strip()
+        if head_commit != branch_commit:
+            ourversion += f"-{head_commit}"
+        else:
+            is_branch_tip = True
+            ourversion += "-tip"
 
 series = [k for k in release_series]
 previousseries = series[series.index(ourseries)+1:] or [""]
@@ -190,6 +193,7 @@ else:
 print("Version calculated to be %s" % ourversion)
 print("Latest release tag found is %s" % latestreltag)
 print("Release series calculated to be %s" % ourseries)
+print("Bitbake version calculated to be %s" % bitbakeversion)
 
 replacements = {
     "DISTRO" : ourversion,
@@ -200,7 +204,7 @@ replacements = {
     "DISTRO_NAME_NO_CAP_MINUS_ONE" : previousseries[0],
     "DISTRO_NAME_NO_CAP_LTS" : lastlts[0],
     "YOCTO_DOC_VERSION" : ourversion,
-    "DOCCONF_VERSION" : docconfver,
+    "DOCCONF_VERSION" : ourversion,
     "BITBAKE_SERIES" : bitbakeversion,
 }
 
@@ -225,39 +229,51 @@ if os.path.exists("poky.yaml.in"):
 
     print("poky.yaml generated from poky.yaml.in")
 
-
-# In the switcher list of versions we display:
-#  - latest dev
-#  - latest stable release
-#  - latest LTS
-#  - latest for each releases listed as active
-#  - latest doc version in current series
-#  - current doc version
-# (with duplicates removed)
+def get_latest_tag(branch: str) -> str:
+    """
+    Get the latest tag of `branch`.
+    """
+    branch_versions = subprocess.run(["git", "tag", "--list", f'yocto-{release_series[branch]}*'],
+                                     stdout=subprocess.PIPE, stderr=subprocess.PIPE,
+                                     universal_newlines=True).stdout.split()
+    branch_versions = sorted(
+        [v.replace("yocto-" +  release_series[branch] + ".", "")\
+         .replace("yocto-" + release_series[branch], "0") for v in branch_versions],
+        key=int)
+    if not branch_versions:
+        return ""
+
+    version = release_series[branch]
+    if branch_versions[-1] != "0":
+        version = version + "." + branch_versions[-1]
+    return version
+
+def get_abbrev_hash(ref: str) -> str:
+    """
+    Get the abbreviated hash of 
+    """
+    return subprocess.run(["git", "rev-parse", "--short", ref],
+                          stdout=subprocess.PIPE, stderr=subprocess.PIPE,
+                          universal_newlines=True).stdout.strip()
 
 versions = []
 with open("sphinx-static/switchers.js.in", "r") as r, open("sphinx-static/switchers.js", "w") as w:
     lines = r.readlines()
     for line in lines:
-        if "ALL_RELEASES_PLACEHOLDER" in line:
-            w.write(str(list(release_series.keys())))
-            continue
         if "VERSIONS_PLACEHOLDER" in line:
-            w.write("    'dev': { 'title': 'Unstable (dev)', 'obsolete': false,},\n")
-            for branch in activereleases + ([ourseries] if ourseries not in activereleases else []):
-                if branch == devbranch:
-                    continue
-                branch_versions = subprocess.run('git tag --list yocto-%s*' % (release_series[branch]), shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True).stdout.split()
-                branch_versions = sorted([v.replace("yocto-" +  release_series[branch] + ".", "").replace("yocto-" +  release_series[branch], "0") for v in branch_versions], key=int)
-                if not branch_versions:
-                    continue
-                version = release_series[branch]
-                if branch_versions[-1] != "0":
-                    version = version + "." + branch_versions[-1]
-                versions.append(version)
-                w.write("    '%s': {'title': '%s (%s)', 'obsolete': %s,},\n" % (version, branch.capitalize(), version, str(branch not in activereleases).lower()))
-            if ourversion not in versions and ourseries != devbranch:
-                w.write("    '%s': {'title': '%s (%s)', 'obsolete': %s,},\n" % (ourversion, ourseries.capitalize(), ourversion, str(ourseries not in activereleases).lower()))
+            w.write(f"    'dev': {{'title': 'Unstable (dev)', 'hash': '{get_abbrev_hash('master')}'}},\n")
+            for branch in activereleases:
+                series = release_series[branch]
+                w.write(f"    '{series}-tip': {{'title': '{branch.capitalize()} ({get_latest_tag(branch)})', "
+                        f"'hash': '{get_abbrev_hash(branch)}'}},\n")
+        elif "ALL_RELEASES_PLACEHOLDER" in line:
+            for series in release_series:
+                w.write(f"    '{release_series[series]}': "
+                        f"{{'codename': '{series.capitalize()}', "
+                        f"'latest_tag': '{get_latest_tag(series)}'}},\n")
+        elif "LATEST_VERSION_PLACEHOLDER" in line:
+            latest_series = release_series[activereleases[0]]
+            w.write(f"    '{latest_series}-tip'\n")
         else:
             w.write(line)
 
diff --git a/documentation/sphinx-static/switchers.js.in b/documentation/sphinx-static/switchers.js.in
index b1c0812b5..0edb0240c 100644
--- a/documentation/sphinx-static/switchers.js.in
+++ b/documentation/sphinx-static/switchers.js.in
@@ -9,14 +9,18 @@ by https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-b
 (function() {
   'use strict';
 
-  var all_releases =
+  var all_releases = {
 	ALL_RELEASES_PLACEHOLDER
-  ;
+  };
 
   var switcher_versions = {
     VERSIONS_PLACEHOLDER
   };
 
+  var latest_version =
+    LATEST_VERSION_PLACEHOLDER
+  ;
+
   var all_doctypes = {
       'single': 'Individual Webpages',
       'mega': "All-in-one 'Mega' Manual",
@@ -66,23 +70,43 @@ by https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-b
     return 0;
   }
 
-  function build_version_select(current_series, current_version) {
+  function build_version_select(current_version) {
     var buf = ['<select>'];
 
-    $.each(switcher_versions, function(version, vers_data) {
-      var series = version.substr(0, 3);
-      if (series == current_series) {
-        if (version == current_version)
-            buf.push('<option value="' + version + '" selected="selected">' + vers_data["title"] + '</option>');
-	      else
-            buf.push('<option value="' + version + '">' + vers_data["title"] + '</option>');
-      } else {
-        buf.push('<option value="' + version + '">' + vers_data["title"] + '</option>');
+    // Start by pushing the versions from the the switcher_versions array,
+    // unless our current version matches one of them, in which case this is
+    // done last.
+    $.each(switcher_versions, function (version, vers_data) {
+      if (current_version != version) {
+        buf.push(
+          '<option value="' +
+          version +
+          '" selected="selected">' +
+          vers_data['title'] +
+          "</option>",
+        );
       }
     });
 
-    buf.push('</select>');
-    return buf.join('');
+    var current_title = current_version;
+    var current_series = current_version.split("-")[0].split(".").slice(0, 2).join(".");
+    if (current_version in switcher_versions) {
+      current_title = switcher_versions[current_version]['title'];
+    } else if (current_series in all_releases) {
+      current_title = all_releases[current_series]['codename'] + ' (' + current_version + ')';
+    }
+
+    buf.push(
+      '<option value="' +
+        current_version +
+        '" selected="selected">' +
+        current_title +
+        "</option>",
+    );
+
+    buf.push("</select>");
+    return buf.join("");
+  }
   }
 
   function build_doctype_select(current_doctype) {
@@ -158,23 +182,35 @@ by https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-b
     var current_version = DOCUMENTATION_OPTIONS.VERSION;
     var docroot = get_docroot_url()
 
-    var new_versionpath = selected_version + '/';
+    // If the current_version is X.Y-tip, we are currently browsing a branch
+    // tip, and we need to convert it to the branch name.
+    var current_version_split = current_version.split("-");
+    if ((current_version_split.length > 1) && (current_version_split[1] == "tip")) {
+      current_version = all_releases[current_version_split[0]]['codename'].toLowerCase();
+    }
+
+    if (selected_version == latest_version) {
+      // default landing page selected, empty the version
+      var new_versionpath = '';
+    } else if (selected_version.includes("-tip")) {
+      var branch_name = all_releases[selected_version.split("-")[0]]['codename'].toLowerCase();
+      var new_versionpath = branch_name + '/';
+    } else {
+      var new_versionpath = selected_version + '/';
+    }
 
-    // latest tag is also the default page (without version information)
-    if (docroot.endsWith(current_version + '/') == false) {
-        var new_url = docroot + new_versionpath + url.replace(docroot, "");
-        var fallback_url = docroot + new_versionpath;
+    if (docroot.endsWith("dev/")) {
+      var new_url = url.replace("/dev/", "/" + new_versionpath);
+      var fallback_url = new_url.replace(url.replace(docroot, ""), "");
+    } else if (docroot.endsWith(current_version + "/") == false) {
+      var new_url = docroot + new_versionpath + url.replace(docroot, "");
+      var fallback_url = docroot + new_versionpath;
     } else {
-	// check for named releases (e.g. dunfell) in the subpath
-        $.each(all_releases, function(idx, release) {
-		if (docroot.endsWith('/' + release + '/')) {
-			current_version = release;
-			return false;
-		}
-	});
-
-        var new_url = url.replace('/' + current_version + '/', '/' + new_versionpath);
-        var fallback_url = new_url.replace(url.replace(docroot, ""), "");
+      var new_url = url.replace(
+        "/" + current_version + "/",
+        "/" + new_versionpath,
+      );
+      var fallback_url = new_url.replace(url.replace(docroot, ""), "");
     }
 
     console.log(get_docroot_url())
@@ -222,10 +258,9 @@ by https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-b
   }
 
   $(document).ready(function() {
-    var release = DOCUMENTATION_OPTIONS.VERSION;
+    var current_version = DOCUMENTATION_OPTIONS.VERSION;
     var current_doctype = doctype_segment_from_url(window.location.href);
-    var current_series = release.substr(0, 3);
-    var version_select = build_version_select(current_series, release);
+    var version_select = build_version_select(current_version);
 
     $('.version_switcher_placeholder').html(version_select);
     $('.version_switcher_placeholder select').bind('change', on_version_switch);
@@ -235,22 +270,36 @@ by https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-b
     $('.doctype_switcher_placeholder').html(doctype_select);
     $('.doctype_switcher_placeholder select').bind('change', on_doctype_switch);
 
-    if (release != "dev") {
+    // First, check that the version is not one of: dev, next, or any "*-tip"
+    if (!(["dev", "next"].includes(current_version)) && !(current_version.includes("-tip"))) {
+      // We could be either: a fixed tag (X.Y[.Z]) or a floating commit (X.Y[.Z]-<hash>)
+      var current_version_split = current_version.split("-");
+      var current_version_no_hash = current_version_split[0];
+      if (current_version_split.length > 1) {
+        // We're on a floating commit, we don't care
+        return;
+      }
+      var current_series = current_version_no_hash.split(".").slice(0, 2).join(".");
+      var match = false;
       $.each(switcher_versions, function(version, vers_data) {
-        var series = version.substr(0, 3);
-        if (series == current_series) {
-          if (version != release && release.endsWith('.999') == false) {
-            $('#outdated-warning').html('This document is for outdated version ' + release + ', you should select the latest release version in this series, ' + version + '.');
-            $('#outdated-warning').css('padding', '.5em');
-            return false;
-          }
-          if (vers_data["obsolete"]) {
-            $('#outdated-warning').html('Version ' + release + ' of the project is now considered obsolete, please select and use a more recent version');
-            $('#outdated-warning').css('padding', '.5em');
-            return false;
+        var series = version.split("-")[0];
+        if (current_series == series) {
+          // Our version is part of the supported releases (switcher_versions)
+          match = true;
+          if (ver_compare(current_version_no_hash, all_releases[series]['latest_tag']) >= 0) {
+            // Our version is higher or equal to the latest_tag from our series
+            return;
           }
+          $('#outdated-warning').html('This document is for an outdated tag ' + current_version + ', you should select version ' + all_releases[series]['codename'] + ' (' + all_releases[series]['latest_tag'] + ').');
+          $('#outdated-warning').css('padding', '.5em');
+          return;
         }
       });
+      if (!match) {
+        // Our version is not part of the supported releases (switcher_versions)
+        $('#outdated-warning').html('This document is for obsolete release ' + current_version + ', you should select a supported release.');
+        $('#outdated-warning').css('padding', '.5em');
+      }
     }
   });
 })();

-- 
2.52.0


