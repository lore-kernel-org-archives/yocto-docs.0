Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A406C98321
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 19:29:51 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6672.1790278183695162612
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 12:29:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=gIznnC8I;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20260924192940286903c087000207df-2xzunj@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260924192940286903c087000207df
        for <docs@lists.yoctoproject.org>;
        Thu, 24 Sep 2026 21:29:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=D+gFtBvzro3mpYifrYBSS5YMK6g+MRuokJQ8tkRrmrA=;
 b=gIznnC8IxCjYdaBkkvEwkN935Rqm8Tl3dELDk4Skznv2+LNWorBBwYc3kVW+Db+TSg5UXq
 5N8vrN6oSqDiWDJTGNMN5u19Gtxph81ttugYNPwF9p0RHiloX6elpGEsUm3qhmk0IHcXuJe/
 3Giws/Pxh40IyQe3lFrh+qkrL7rSZZ+LBoab+vy/jwXNaBtJU3JELR7qUp+uYbb2ct/YLv9U
 QPUhfqay4sbUWQt1Vkm/uq4VVnEDaK1c3PA8zpF4a0ezYwHJfrpZCAIgzRFt6z0pdSaJY7Rj
 YrCsGo582gGKzcHBZlxtnCdPuoY8ZWZc+JyufnDtcOWwOb9K3CGeTHlw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 3/5] conf.py: support mermaid plugin
Date: Thu, 24 Sep 2026 21:29:05 +0200
Message-ID: <20260924192929.907566-4-adrian.freihofer@siemens.com>
In-Reply-To: <20260924192929.907566-1-adrian.freihofer@siemens.com>
References: <20260924192929.907566-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 19:29:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10636

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add the sphinxcontrib-mermaid extension so ".mmd" Mermaid diagrams can
be included directly via the "mermaid" directive and rendered
client-side, without pre-rendering and committing image files.

This adds sphinxcontrib-mermaid as a new Pipfile/build dependency. No
other tooling (e.g. Node.js, mermaid-cli/mmdc) is required on the build
server: with the default "raw" output format, diagrams are shipped as-is
in the HTML and rendered in the reader's browser via mermaid.js, loaded
from a CDN.

Without Pipenv, a plain venv also works, e.g.:

    python3 -m venv .venv
    .venv/bin/pip install sphinx sphinx-rtd-theme sphinx-copybutton \
        sphinxcontrib-mermaid sphinxcontrib-svg2pdfconverter pyyaml

Also tweak mermaid_height and the diagram font in theme_overrides.css
to fix distorted/clipped diagram rendering.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/Pipfile                           |  1 +
 documentation/conf.py                           |  6 ++++++
 documentation/sphinx-static/theme_overrides.css | 17 +++++++++++++++++
 3 files changed, 24 insertions(+)

diff --git a/documentation/Pipfile b/documentation/Pipfile
index f415cbf3f..5fcd8b9c3 100644
--- a/documentation/Pipfile
+++ b/documentation/Pipfile
@@ -12,6 +12,7 @@ sphinx = "*"
 sphinx-rtd-theme = "*"
 pyyaml = "*"
 sphinx-copybutton = "*"
+sphinxcontrib-mermaid = "*"
 # SVG to PNG only supported since 2.0.0
 sphinxcontrib-svg2pdfconverter = ">=2.0.0"
 
diff --git a/documentation/conf.py b/documentation/conf.py
index 48d28a686..c1b418499 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -50,10 +50,16 @@ extensions = [
     'sphinx.ext.extlinks',
     'sphinx.ext.intersphinx',
     'sphinx_copybutton',
+    'sphinxcontrib.mermaid',
     'sphinxcontrib.rsvgconverter',
     'yocto-vars'
 ]
 
+# Let Mermaid diagrams keep their natural aspect ratio (based on each
+# diagram's own width/height) instead of being squeezed into the default
+# fixed 500px height, which visibly distorted/shrank taller flowcharts.
+mermaid_height = "auto"
+
 # current_version = "dev"
 # bitbake_version = "" # Leave empty for development branch
 # Obtain versions from poky.yaml instead
diff --git a/documentation/sphinx-static/theme_overrides.css b/documentation/sphinx-static/theme_overrides.css
index f9e067239..0b2be9e01 100644
--- a/documentation/sphinx-static/theme_overrides.css
+++ b/documentation/sphinx-static/theme_overrides.css
@@ -171,3 +171,20 @@ section#welcome-to-the-yocto-project-documentation p.caption {
     }
 
 }
+
+/*
+ * Mermaid diagrams are rendered inside a <pre class="mermaid"> element, so
+ * they otherwise inherit this theme's monospace "pre" font, and some of
+ * Mermaid's edge labels end up keeping their default 16px font size instead
+ * of the larger size configured in the diagrams themselves. Force a
+ * consistent, larger, non-monospace font so label text isn't clipped by a
+ * too-small measured bounding box.
+ */
+.mermaid,
+.mermaid .edgeLabel,
+.mermaid .edgeLabel p,
+.mermaid .nodeLabel,
+.mermaid .nodeLabel p {
+  font-family: Helvetica, Arial, sans-serif !important;
+  font-size: 20px !important;
+}
-- 
2.55.0


