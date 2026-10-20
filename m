Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2884.1792485848927742562
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Oct 2026 01:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=X5TP2z/G;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20261020084403f916e077690002077f-uathl1@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20261020084403f916e077690002077f
        for <docs@lists.yoctoproject.org>;
        Tue, 20 Oct 2026 10:44:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=LxAcOTvJDVnav8qgUME8Xl8rIIiCIII/lfiaihHs+fA=;
 b=X5TP2z/G2c4V5g1x3abW2/Iy7wi4D6JN3wgO+VSA/dwIIqT+SmF+JLxqPPiu5JhVA/eXit
 UfsLOAehcASDwCL8lDGRVMkRybIV4DoM1p+Ds9D0BKWccxrKNlIaYRncqYwALvI68i2IbQnC
 xglWUx6WouronBgB+dChped0fX7pBZnjkWQgc6U9iClpTLpdpjdvunqzQd6VoQus20iRw9nI
 vdTVfD7YJ8UqmonPV2gn3uEvm5vwxISxJP3U5i5tCk0uJTr8TPecfr0FKLBu2Yn7Hbjp/ZBR
 XiqpeqcSJtjbpqTe7N3gLO6hSUW0LqueQCnVftd8rVu6UdYL2pWrZnMA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 0/4] dev-manual/devtool: ide-sdk doc rewrite and Mermaid diagrams
Date: Tue, 20 Oct 2026 10:43:36 +0200
Message-ID: <20261020084359.354498-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Tue, 20 Oct 2026 08:44:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10698
Content-Type: text/plain; charset="utf-8"

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Update the "devtool ide-sdk" section to reflect its current behavior,
and fix outdated non-patch local file handling docs (5.1 change).

Add workflow/architecture diagrams for "devtool ide-sdk", and convert the
existing devtool add/modify/upgrade flow chart PNGs to Mermaid too. The
Mermaid sources (.mmd) and the rendered SVGs are both kept in git, so the
documentation build needs no Mermaid tooling or network access.

Changes in v4:
- Use Nimbus Sans for the diagram text. standards.md still needs to be
  updated for this.
- Keep the .mmd files next to the generated SVGs and don't embed them in
  the SVGs: the SVG is a generated artifact, and the .mmd is the source to
  edit and to regenerate it from (the command is in each .mmd header).
  Embedding would make the workflow complicated, as the source would have
  to be extracted from the SVG again before every edit, and the code to
  do that would be hard to find. A reader also would not see that the
  diagrams are generated with Mermaid. Editing the SVGs by hand, e.g.
  with Inkscape, is cumbersome and against the concept: changes would be
  lost on the next regeneration, so edit the .mmd and regenerate.
- Reference the diagrams as figures/<name>.* so Sphinx picks the best
  format per builder, and give every devtool diagram a caption.
- Fix the "(build directory) build artifacts)" typo in the ide-sdk
  architecture diagrams.
- Place the ide-sdk node before "Edit source code" in the add flow.
- Rework the add/modify flows after checking them against devtool:
  show the workspace sources/ and the existing srctree of "devtool
  modify -n", and route "devtool build-image" to the target (flash,
  firmware update or runqemu) instead of "devtool deploy-target". Only
  "Edit source code" leads to "devtool finish", and no arrows cross.
  The "Left/Middle/Right" scenarios in the text follow the figures.
- Use the same color scheme in the ide-sdk workflow diagram.

Changes in v3:
- Add the rendered SVGs to git next to the .mmd sources, instead of
  rendering the diagrams at build time (drops the sphinxcontrib-mermaid
  extension and the CDN-hosted mermaid.js).
- Restore PDF support, as the SVGs are converted by the existing
  rsvgconverter (not tested yet).

Adrian Freihofer (3):
  dev-manual/devtool: update devtool ide-sdk section for recent features
  dev-manual/devtool: add diagrams for the ide-sdk workflow and
    architecture
  dev-manual/devtool: convert add/modify/upgrade flow diagrams to
    Mermaid

Trevor Woerner (1):
  ref-manual: put the ARCHIVER_MODE comments on their own lines

 documentation/dev-manual/devtool.rst          | 1140 +++++++++++------
 .../dev-manual/figures/devtool-add-flow.mmd   |  107 ++
 .../dev-manual/figures/devtool-add-flow.png   |  Bin 181699 -> 0 bytes
 .../dev-manual/figures/devtool-add-flow.svg   |    1 +
 .../figures/devtool-ide-sdk-architecture.mmd  |   84 ++
 .../figures/devtool-ide-sdk-architecture.svg  |    1 +
 .../devtool-ide-sdk-nfs-architecture.mmd      |   89 ++
 .../devtool-ide-sdk-nfs-architecture.svg      |    1 +
 .../figures/devtool-ide-sdk-workflow.mmd      |   76 ++
 .../figures/devtool-ide-sdk-workflow.svg      |    1 +
 .../figures/devtool-modify-flow.mmd           |  110 ++
 .../figures/devtool-modify-flow.png           |  Bin 171676 -> 0 bytes
 .../figures/devtool-modify-flow.svg           |    1 +
 .../figures/devtool-upgrade-flow.mmd          |   81 ++
 .../figures/devtool-upgrade-flow.png          |  Bin 138917 -> 0 bytes
 .../figures/devtool-upgrade-flow.svg          |    1 +
 .../ref-manual/devtool-reference.rst          |    4 +
 documentation/ref-manual/variables.rst        |   27 +-
 .../sphinx-static/theme_overrides.css         |    5 +
 19 files changed, 1354 insertions(+), 375 deletions(-)
 create mode 100644 documentation/dev-manual/figures/devtool-add-flow.mmd
 delete mode 100644 documentation/dev-manual/figures/devtool-add-flow.png
 create mode 100644 documentation/dev-manual/figures/devtool-add-flow.svg
 create mode 100644 documentation/dev-manual/figures/devtool-ide-sdk-architecture.mmd
 create mode 100644 documentation/dev-manual/figures/devtool-ide-sdk-architecture.svg
 create mode 100644 documentation/dev-manual/figures/devtool-ide-sdk-nfs-architecture.mmd
 create mode 100644 documentation/dev-manual/figures/devtool-ide-sdk-nfs-architecture.svg
 create mode 100644 documentation/dev-manual/figures/devtool-ide-sdk-workflow.mmd
 create mode 100644 documentation/dev-manual/figures/devtool-ide-sdk-workflow.svg
 create mode 100644 documentation/dev-manual/figures/devtool-modify-flow.mmd
 delete mode 100644 documentation/dev-manual/figures/devtool-modify-flow.png
 create mode 100644 documentation/dev-manual/figures/devtool-modify-flow.svg
 create mode 100644 documentation/dev-manual/figures/devtool-upgrade-flow.mmd
 delete mode 100644 documentation/dev-manual/figures/devtool-upgrade-flow.png
 create mode 100644 documentation/dev-manual/figures/devtool-upgrade-flow.svg

-- 
2.56.0

