Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13314EDF05F
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 08:37:53 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41236.1770885471338613510
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Feb 2026 00:37:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qqO4t8wi;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5F9E64E40CB4
	for <docs@lists.yoctoproject.org>; Thu, 12 Feb 2026 08:37:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 35D8C606CA
	for <docs@lists.yoctoproject.org>; Thu, 12 Feb 2026 08:37:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 50A51119711E9;
	Thu, 12 Feb 2026 09:37:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770885468; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DghCAD5tew4yvXmtPXmD3dyYDN+Iz4Qrjk2H/HHgKZo=;
	b=qqO4t8wipe4PCDXxakXGb8pUOMXHlZrc5ahkWMtPlMNecWd44mOSiJ+B5pkz14xE8KAQOs
	IQlCmRUd29gmc6X/DMrLNc/yTlsfK/gVJC3RoF86WNIKvRVAF5C2Qr/y90VR92xrb4G5qD
	4OzJ7719HoorqZTYiE51lgCbHc47odiVzYQrg5mpXOJKX46C9pBy4kEfTMDq5q3XfeSlPo
	5e2UXFYiPd+FVZusvfTcYY6YKDqEPz0HVK+rP4xFxqHx13GDkp+FvpnApxEunh+Em7un1d
	0U+q/ZXHleHYZuTijwYMaVqij4MoQZ8eiS+UMqaJE0bUzsFlN1HjIoj5pfNk/Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 12 Feb 2026 09:37:38 +0100
Subject: [PATCH 2/3] switchers.js: rework the logic and improve it
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-fix-switchers-js-v1-2-16d95c74c328@bootlin.com>
References: <20260212-fix-switchers-js-v1-0-16d95c74c328@bootlin.com>
In-Reply-To: <20260212-fix-switchers-js-v1-0-16d95c74c328@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=19710;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=JCRU8SaX5vCASzk3+YwiAoJDWIuxOienneyaZKfePLs=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpjZFanYHJdKKZnW1zbDdKLHr+k41+e2LrdJECb
 /gcmslyXLiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaY2RWgAKCRDRgEFAKaOo
 NkUED/9gWXB4ykZluJIR5vJJdBooafj4caKTjEB7E8LxYuiv0+y5RH0B15VUIRUMOqA05X0EUiz
 QvSVmrY7Tt1QCa3IWAP1K8xHBO4AMyKgc6i2/3rbPd207Lv8WYsn63mz0Bq3Noo4R9VxJEbNaRk
 0pX0GoxcIoX9OXMYb4FpoBWZdxy3fZZg3y8ACQsQH9opKwOfQpYcdWdDHOy5T5zDru3AeUYwy+8
 FiZe2k7xsU09ClcsQoCwMt7RUQrWScQOp10aqfxr+WDMaMfoB7+TRdetA5x3kO8ZGbj7YAwvq9j
 cmDWPY/Gi16urf5v+Tf8we6/TmJNyT1OSpdouK56Rm1UOU5gej9jw366A91AX8ucGzy35HYYLdt
 h3aJrQjgIN65CZBDDgFjfveaI86UbrfVOsx7DhvalOjVS9Az+/0a9hK528Ch7nA2Gv9w9fWgWqs
 wNAGvxbK4wxt+sJnn+KVB5ya9qH4Jhidfb6QMCMDPvVhEVavPQu4ijSM+If3gYRv05e0CZ2xqfH
 wEaqAyBkwcbbnE95ei6NmZm7rkcju6/otiqD2RLTBeluCU5RQFykUlK22rUh0Mu+DyC5+aRagLf
 m/MrtUoTc9Pdz94DTYNB2YK4c+qmPEFJVtiyEnoEynMYRTCOuiUWydNpqg4CdoeTtS+OttwpVOr
 UsBV3QvdRiOxJpQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 12 Feb 2026 08:37:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8897

Rework the generation of the switcher menu, and also fix it. It's not
obvious how this could be split for easier review, as many parts depend on
one another, so this is what this patch changes and fixes:

- Show "(latest)" when we are building for the tip of a branch (which is
  not a tag). This replaces the ".999" suffix which was confusing for
  some people.

- Show a commit id when building on a separate commit that is not a
  branch tip or not a tag. This should only ever happen when building
  locally (not for the published version).

- Make the default landing be the current active release, shown as e.g.
  "Whinlatter (5.3 (latest))" in the menu. And make it part of the fixed
  version, meaning we can go back to it if we change to another.

- All stable/LTS versions are displayed in the menu UNLESS the current
  version for which we are viewing is part of them, in which case it's
  shown last in the menu.

- There is one exception to the above: if the current active release is
  "Whinlatter (5.3 (latest))", and we navigate to _tag_ 5.3, since the
  version is seen for both as "5.3" to Sphinx, keep the "latest"
  version in the menu.

- Rework the logic to show outdated or obsolete versions to conform with
  the above changes, but overall it behaves the same:

  - granted that Kirkstone is an active release, and 4.0.32 is the
    latest tag for this release, the "outdated" banner is displayed.

  - browsing any version not part of the active release (all LTS
    versions + the stable branch) will show the "obsolete" banner.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/set_versions.py               | 131 +++++++++++++++------------
 documentation/sphinx-static/switchers.js.in | 132 +++++++++++++++++++---------
 2 files changed, 163 insertions(+), 100 deletions(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index 64b58f103..66e845c97 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -94,6 +94,7 @@ ourseries = None
 ourbranch = None
 bitbakeversion = None
 docconfver = None
+head_commit = None
 
 # Test tags exist and inform the user to fetch if not
 try:
@@ -106,29 +107,30 @@ tags = subprocess.run(["git", "tag", "--points-at", "HEAD"], stdout=subprocess.P
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
@@ -140,29 +142,29 @@ else:
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
+            ourversion += f" ({head_commit})"
+        else:
+            ourversion += " (latest)"
 
 series = [k for k in release_series]
 previousseries = series[series.index(ourseries)+1:] or [""]
@@ -182,6 +184,7 @@ else:
 print("Version calculated to be %s" % ourversion)
 print("Latest release tag found is %s" % latestreltag)
 print("Release series calculated to be %s" % ourseries)
+print("Bitbake version calculated to be %s" % bitbakeversion)
 
 replacements = {
     "DISTRO" : ourversion,
@@ -192,7 +195,7 @@ replacements = {
     "DISTRO_NAME_NO_CAP_MINUS_ONE" : previousseries[0],
     "DISTRO_NAME_NO_CAP_LTS" : lastlts[0],
     "YOCTO_DOC_VERSION" : ourversion,
-    "DOCCONF_VERSION" : docconfver,
+    "DOCCONF_VERSION" : ourversion,
     "BITBAKE_SERIES" : bitbakeversion,
 }
 
@@ -227,29 +230,41 @@ if os.path.exists("poky.yaml.in"):
 #  - current doc version
 # (with duplicates removed)
 
+def get_latest_tag(branch: str) -> str:
+    """
+    Get the latest tag of `branch`.
+    """
+    branch_versions = subprocess.run('git tag --list yocto-%s*' %
+                                     (release_series[branch]), shell=True,
+                                     stdout=subprocess.PIPE,
+                                     stderr=subprocess.PIPE,
+                                     universal_newlines=True).stdout.split()
+    branch_versions = sorted([v.replace("yocto-" +  release_series[branch] + ".", "").replace("yocto-" + release_series[branch], "0") for v in branch_versions], key=int)
+    if not branch_versions:
+        return ""
+    version = release_series[branch]
+    if branch_versions[-1] != "0":
+        version = version + "." + branch_versions[-1]
+    return version
+
+# The default landing page version, which we always want to show
+default_release_codename = activereleases[0]
+default_release = release_series[default_release_codename]
+
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
+            w.write("    'dev': 'Unstable (dev)',\n")
+            w.write(f"    '{default_release}': '{default_release_codename.capitalize()} ({default_release} (latest))',\n")
+            for branch in activereleases:
+                latest_tag = get_latest_tag(branch)
+                if latest_tag:
+                    w.write(f"    '{latest_tag}': '{branch.capitalize()} ({latest_tag})',\n")
+        elif "ALL_RELEASES_PLACEHOLDER" in line:
+            for series in release_series:
+                w.write(f"    '{release_series[series]}': '{series}',\n")
         else:
             w.write(line)
 
diff --git a/documentation/sphinx-static/switchers.js.in b/documentation/sphinx-static/switchers.js.in
index b1c0812b5..bea8906cf 100644
--- a/documentation/sphinx-static/switchers.js.in
+++ b/documentation/sphinx-static/switchers.js.in
@@ -9,9 +9,9 @@ by https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-b
 (function() {
   'use strict';
 
-  var all_releases =
+  var all_releases = {
 	ALL_RELEASES_PLACEHOLDER
-  ;
+  };
 
   var switcher_versions = {
     VERSIONS_PLACEHOLDER
@@ -66,23 +66,62 @@ by https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-b
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
+    var current_version_num = current_version.split(" ")[0];
+    var docroot_url = get_docroot_url();
+
+    var is_not_latest = false;
+
+    $.each(switcher_versions, function (version, title) {
+      // push static version unless our current version matches one of them
+      // with the exception of our current version being a fixed tag that
+      // matches a "(latest)" version if our static array
+      // for example:
+      //   our version is "5.3" because we are on https://<docroot_url>/5.3/
+      //   our array contains "5.3": "Whinlatter (5.3 (latest))"
+      //   then we still want to show the "(latest)" version _and_ the current one
+      var push = false;
+      if ((current_version_num == version) && (docroot_url.endsWith(current_version_num + '/')) && (title.includes("(latest)"))) {
+        push = true;
+        is_not_latest = true;
+      } else if (current_version_num != version) {
+        push = true;
+      }
+      if (push) {
+        buf.push(
+          '<option value="' +
+          version +
+          '" selected="selected">' +
+          title +
+          "</option>",
+        );
       }
     });
 
-    buf.push('</select>');
-    return buf.join('');
+    var current_title = current_version;
+    if ((current_version_num in switcher_versions) && (!is_not_latest) && (!current_version.split(" ")[1])) {
+      current_title = switcher_versions[current_version_num];
+    } else if (!(["dev", "next"].includes(current_version))) {
+      var current_series = current_version_num.split(".").slice(0, 2).join(".");
+      if (current_series in all_releases) {
+        // capitalize codename
+        var series_name = all_releases[current_series].charAt(0).toUpperCase() + all_releases[current_series].slice(1);
+        current_title = series_name + " (" + current_version + ")";
+      }
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
   }
 
   function build_doctype_select(current_doctype) {
@@ -156,25 +195,30 @@ by https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-b
     var selected_version = $(this).children('option:selected').attr('value');
     var url = window.location.href;
     var current_version = DOCUMENTATION_OPTIONS.VERSION;
+    var current_version_info = current_version.split(" ");
+    var selected_version_info = selected_version.split(" ");
     var docroot = get_docroot_url()
 
-    var new_versionpath = selected_version + '/';
+    if ((selected_version_info[0] in switcher_versions) && (switcher_versions[selected_version_info[0]].includes("latest"))) {
+      // default landing page selected, empty the version
+      var new_versionpath = '';
+    } else {
+      var new_versionpath = selected_version + '/';
+    }
 
     // latest tag is also the default page (without version information)
-    if (docroot.endsWith(current_version + '/') == false) {
-        var new_url = docroot + new_versionpath + url.replace(docroot, "");
-        var fallback_url = docroot + new_versionpath;
+    if (docroot.endsWith("dev/")) {
+      var new_url = url.replace("/dev/", "/" + new_versionpath);
+      var fallback_url = new_url.replace(url.replace(docroot, ""), "");
+    } else if (docroot.endsWith(current_version_info[0] + "/") == false) {
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
+        "/" + current_version_info[0] + "/",
+        "/" + new_versionpath,
+      );
+      var fallback_url = new_url.replace(url.replace(docroot, ""), "");
     }
 
     console.log(get_docroot_url())
@@ -224,8 +268,7 @@ by https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-b
   $(document).ready(function() {
     var release = DOCUMENTATION_OPTIONS.VERSION;
     var current_doctype = doctype_segment_from_url(window.location.href);
-    var current_series = release.substr(0, 3);
-    var version_select = build_version_select(current_series, release);
+    var version_select = build_version_select(release);
 
     $('.version_switcher_placeholder').html(version_select);
     $('.version_switcher_placeholder select').bind('change', on_version_switch);
@@ -235,22 +278,27 @@ by https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-b
     $('.doctype_switcher_placeholder').html(doctype_select);
     $('.doctype_switcher_placeholder select').bind('change', on_doctype_switch);
 
-    if (release != "dev") {
+    var release_info = release.split(" ");
+    if (!(["dev", "next"].includes(release_info[0]))) {
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
+        var series = version.split(".").slice(0, 2).join(".");
+        if ((!vers_data.includes("(latest)")) && (release_info[0].startsWith(series))) {
+          match = true;
+          if (ver_compare(release_info[0], version) >= 0) {
+            return;
+          } else if ((release_info.length > 1) && (release_info[1] == "(latest)")) {
+            return;
           }
+          $('#outdated-warning').html('This document is for an outdated version ' + release_info[0] + ', you should select version ' + version + '.');
+          $('#outdated-warning').css('padding', '.5em');
+          return;
         }
       });
+      if (!match) {
+        $('#outdated-warning').html('This document is for obsolete release ' + release_info[0] + ', you should select a supported release.');
+        $('#outdated-warning').css('padding', '.5em');
+      }
     }
   });
 })();

-- 
2.52.0


