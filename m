Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9343.1793612900646001674
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Nov 2026 01:48:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=KkOlZiGE;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=IeZyNXbe;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.147, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 9647DEC0118
	for <docs@lists.yoctoproject.org>; Mon,  2 Nov 2026 04:48:19 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Mon, 02 Nov 2026 04:48:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1793612899; x=1793699299; bh=KN
	cqnrl66l8zYl6s9H1oEz7b6Mfo4TCpNoVp3X297mM=; b=KkOlZiGE6qJ8hI9K5A
	Ds/YzImO/Hf+aS7qp4iTQNhlKwRfdj9zD5WLbH1K4cZwGq5npGEkAteGFogxaXV4
	JUPKuNADyA3CHQJ7MC1Tc3rd6JPMr+itSXE/v0SP3BSNVnSvXLTmU9+u8N90hSLk
	+qPZHdRK+FW8uKUmTzd8sZ12Fm+15BFWJp01mujHjjsNDsDXejvTi9AxOE/ILy/A
	Z62Z7Mq8tve5pUM00S1yJNALbd9E82WGi3ftwf/P3YAGgSGLYhshHgXFpVCz5qnQ
	yGjLu/OS1IEL9eJDBwcmgBMcngMNUAAdjUYt447h2lIkZKmc4OPXqm0CgR7hBxlM
	a3jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1793612899; x=1793699299; bh=KNcqnrl66l8zYl6s9H1oEz7b6Mfo
	4TCpNoVp3X297mM=; b=IeZyNXbelMMY/rImlOe6SdFlPPiQCe8khovmK2VqLhKs
	gSGH5tRdy+zPS0qwcF1EjD5m3MgqviiJenAPyw10a3vsKffO9g4SJt80WGAZ7QZO
	VW0QuN0lulKVQUsbMIE00MI7qhul2jc4Q7PfC02+5DliL2ozi7vWp2gRIbNTYxdM
	/Z8G6Wp+j+Z9vW+PfT6KzRB7RPIr4Us7eOqGEUXbBC2o0h3HtAMVTkfJQqisNVKX
	PLQTazFe3HUyzVZ3pCvY+JEzZnmcURDDF6xB4S9KXz3+NNwCOQ0IO8bwiR4rsdQq
	U5wyFF9wyHCbjvbUolWNmtbpBv+wcPn+/0XWA8nN/w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793612899; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PGRvY3NAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4=;
	s=fm1:rsa-sha256:m1aIr+oUmnpHRgWDrOBuMwXJpzLmgSNFTZm/bejIlDYix6G
	1Q10QQzQAyQLg6ulrPb/Tq27x/ETCeGrLef3eRMAmF2TcYXsldO8LgacjkloIy9H
	YP9Z6/jSsmo5lm3k9FaBbYTtCyLu4oielZoUrlb8fMFQyoR+WhaSE6otpawmUzXJ
	RV4LeT/Y05L4MUEknlJCMNfChlmUNTal6b4tSlLSCJejmgVJnNsqdpAa6FBEE740
	/EPSazJG1Gvjo2njtMESvXWn+eCP/6rdScury9E/CI7PhpKXC8eb7x2rKesc+JPJ
	7jPGEo8hsfx/KIphv4WqaBOmBkfwzkiuYJJFmNQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:QK1JIXp+vzP6z88UoCosJ8Epk1Ch7lVxQO3Nlcj6H2w=:nOPrPhf8xjdVp5m/LY58bkI9sstWCwbDQVqsTVHKr2w=;
X-ME-Sender: <xms:Y1zoahO72z0VMaods74yI4XGbkikiOGRVcubvb1OE299-__BJCkuFA>
    <xme:Y1zoavYGvP5i2Fb4LWiHe_5Q853QnUR4F6OcEePLArS9qIwqqOuxxw9Ge6QHAQpk5
    llJvF6CmUb8RAvPhnJTJKsRMP_ZZzBadyIHs9Y-WWPHB-ZhSQykaC_Y>
X-ME-Received: <xmr:Y1zoajwOA6s7FF4D4ME5mAnvXB63QpOPOnI4OgA7jivlh7naB_BhcCZ6_of5Fw4Bh6-8lAw0UIyCvR75ehGD7ah5XsVpRHSgmYgIxpPg>
X-ME-Proxy-Cause: dmFkZTGhwm6EAprcbYdP8sa8XtDTowugjfQDvhsz4tqWSH8+SrOeo4RegavOpvpVOFaydS
    YKkhgo1r+B+zJ1hBG6Qt+T4voNHM0OYWpR1Jb+NW+KjpHgLYqrujJR1yy6UuHStG2gHz+m
    gpnmOiE7FS06xyPh4LS1o/wEhzqRr6PaP3yha9XNihyl1cDbN2PBXiNKWsGHMvfjgpQrMZ
    tc9YKzaQvmg8v2JHugGfXDHintZqWktTESQQHU1AiLreRL6eiVGEJkw/JvEphnhnt2S7ev
    +fN9QrHN2hZuABDePE58t/BzCXK4Ttjfubd7WYsXyS6yQ0mhm/QMu7COxpAlFgmiqpSKEQ
    5Rk/1qj7NJE2BYz9Ey2jlKpWwJPBCkm5bPZrjM46+twUrKiiINCySEt6FYhmnz5AkulDKK
    w8tHABdzq9gGuFXNfGs67m3hr1+FoOWCPM4PKRUT5+RRnLO6X4fVqmcDgCEmw6rhpEoQlb
    hCAxTRya+PulVFcce66kAFwzZlmzJ88DkrFNWOWDj7GBJZfzHHjr0fZ7Et+01Sw+Dyr5FY
    m9OcvweqndWHTbhXhg6qbt1zjCzA9MV2wK/v7oMTFu6oFZL79t1jMW+1LGaLBOwObzTBJX
    ODGTTLlx+LGNBFL4kKX5cegQOER8YRfbVcp1UmvgpiIOn4/5XGi020RUZwOQ
X-ME-Proxy: <xmx:Y1zoaiLek9F2nfFj0oVliOe6btpN-xB3o8QE-I5HL9AXOtKqPOV9Yg>
    <xmx:Y1zoalqz8vu9Kb1PKeohT-zjv1H016-IQCqlSQRqdEcp5lMwHwDd1w>
    <xmx:Y1zoapJjEjxhBRjiM5CS65MG-vgAR-VY1QXVZcaEgCdhSJ_M5YgC1Q>
    <xmx:Y1zoaiRO97R4xl_F5JiSv7fVi-vG5Cjv5GzfaoBRm3Uym_y3plp_DA>
    <xmx:Y1zoamrZtPf5K6fISZEsxC2K5OpwVtW9rLVadgFFayiL87PmKZ-xVzoR>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 04:48:18 -0500 (EST)
From: Paul Barker <paul@pbarker.dev>
Date: Mon, 02 Nov 2026 09:48:15 +0000
Subject: [PATCH] contributor-guide: Adopt new AI-Assisted Contribution
 Policy
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261102-ai-policy-v1-1-db2e89267a1e@pbarker.dev>
X-B4-Tracking: v=1; b=H4sIAF5c6GoC/yXM0QpAMBSA4VfRubbaWUx5FblgzjgS2hAt7264/
 OrvD+DJMXkokwCODva8zBGYJmCGZu5JcBcNSiqNKJVoWKzLxOYSmFmrctRUaAmxXx1ZPr9XVf/
 2ezuS2d4B3PcDawEYzG0AAAA=
X-Change-ID: 20261102-ai-policy-14ff2516e760
To: docs@lists.yoctoproject.org
Cc: yocto@lists.yoctoproject.org, 
 openembedded-architecture@lists.openembedded.org, 
 Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1793612896; l=14829;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=nOPrPhf8xjdVp5m/LY58bkI9sstWCwbDQVqsTVHKr2w=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGQAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEkAAAAhALhN1JDXdxJKLway6nyEhwUp+cT6VsGMY0DHZvfT0CLbAAAAIE8Er2sVi0pbUT
 fCX8J/rfggCzp3/c2Z1w69DJusnx8S
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Mon, 02 Nov 2026 09:48:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10757

Over the last several months, Open Source projects have seen an increase
in AI-assisted contributions - with AI being used to generate email
content, bug reports (including security vulnerability reports) and
other content as well as code. We've taken our time to let things play
out a little before updating our policies around this, but now we do
need to make some changes to ensure that the project remains sustainable
and our community remains healthy.

In brief, these changes allow AI-generated contributions to the project
provided that:

- The LF Generative AI policy is followed.

- There is a human responsible for the contribution who can engage with
  the community, as well as understand and explain their contribution.

- Signed-off-by tags are written by humans, not AI tools.

- Patches against upstream components comply with any relevant upstream
  policy on AI-generated content.

- AI-generated content is disclosed, either using the `AI-Generated` tag
  in commit messages or in free-form text in other contributions.

- Submissions are not fully automated (i.e. no submissions from bots or
  unsupervised agents without prior agreement with the TSC).

- Private or confidential information (including embargoed security
  reports) are not submitted to untrusted third-party services.

The Yocto Project Technical Steering Committee (TSC) has reviewed and
approved this updated policy. We will continue to keep this policy under
review as this is a rapidly evolving area.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
This is a documentation patch, but it has been Cc'd to the yocto@ and
openembedded-architecture@ mailing lists for wider visibility of the
proposed policy changes.
---
 .../ai-assisted-contribution-policy.rst            | 199 +++++++++++++++++++++
 documentation/contributor-guide/index.rst          |   1 +
 documentation/contributor-guide/submit-changes.rst |  50 ------
 3 files changed, 200 insertions(+), 50 deletions(-)

diff --git a/documentation/contributor-guide/ai-assisted-contribution-policy.rst b/documentation/contributor-guide/ai-assisted-contribution-policy.rst
new file mode 100644
index 000000000000..7b8ee82847e3
--- /dev/null
+++ b/documentation/contributor-guide/ai-assisted-contribution-policy.rst
@@ -0,0 +1,199 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+AI-Assisted Contribution Policy
+*******************************
+
+Scope
+=====
+
+This policy applies to all contributions to the Yocto Project which
+include non-trivial AI-generated content.
+
+A *contribution* is anything you send to the project, including:
+
+- Patches, commit messages and cover letters
+
+- Review comments, discussions and other mailing list submissions
+
+- Bug reports and comments in Bugzilla
+
+- Security reports sent to the Security Team
+
+- Wiki content
+
+*AI-generated content* is anything produced by a Large Language Model
+(LLM) or other generative AI technology, including output from AI
+assistants, coding agents, etc.
+
+Trivial or incidental inclusion of AI-generated content is outside the
+scope of this policy - a single line copied from AI-assistant output
+into an otherwise human authored document, or autocompletion of a
+function signature in code that is otherwise hand-written, does not rise
+to the level of significance that we are considering here.
+
+This policy does not apply to upstream projects whose software we
+package, including patch files copied verbatim from upstream. It does
+however apply to patches against upstream software which you modify,
+develop or generate as a contributor to the Yocto Project.
+
+General conditions
+==================
+
+**AI-generated contributions to the Yocto Project must comply with the**
+`Linux Foundation Generative AI Policy`_. In particular,
+
+    Code or other content generated in whole or in part using AI tools can
+    be contributed to Linux Foundation projects. However, there are some
+    unique considerations related to AI generated content that developers
+    should factor into their contributions.
+
+    1. Contributors should ensure that the terms and conditions of the
+       generative AI tool do not place any contractual restrictions on how
+       the tool’s output can be used that are inconsistent with the
+       project’s open source software license, the project’s intellectual
+       property policies, or the Open Source Definition.
+
+    2. If any pre-existing copyrighted materials (including pre-existing
+       open source code) authored or owned by third parties are included in
+       the AI tool’s output, prior to contributing such output to the
+       project, the Contributor should confirm that they have have
+       permission from the third party owners–such as the form of an open
+       source license or public domain declaration that complies with the
+       project’s licensing policies–to use and modify such pre-existing
+       materials and contribute them to the project. Additionally, the
+       contributor should provide notice and attribution of such third party
+       rights, along with information about the applicable license terms,
+       with their contribution.
+
+**All existing Yocto Project contribution guidelines are expected to be
+followed**, including the `Code of Conduct`_, the
+:doc:`/contributor-guide/recipe-style-guide` and the documentation on how to
+:ref:`contributor-guide/submit-changes:Implement and commit changes`.
+
+Human responsibility
+====================
+
+The Yocto Project is a collaborative endeavour and our community is as
+valuable as our code base for the long-term health of the project. At a
+fundamental level, we each need to take responsibility for what we
+contribute to the project. For example, this includes ensuring that our
+contributions follow the project’s Code of Conduct. It also includes
+being respectful of the finite bandwidth that we all have for reading,
+reviewing and responding to contributions.
+
+**Patch authors take responsibility for the code they submit to the
+project** - we expect them to understand and be able to explain the
+proposed changes, to be able to engage with review comments and to be
+able to revise and follow up contributions. Similarly, reviewers must be
+able to participate in discussion about their comments.
+
+For bug reports, including security vulnerability reports, contributors
+must be able to substantiate their findings beyond simply taking
+AI-generated output at its word.
+
+**Do not act as a simple proxy between your AI-agent and the Yocto
+Project community**. When engaging with the community you need to do
+more than just copy questions you are asked into an AI-agent chat and
+send us the output. If you are using an AI-agent to assist you then
+read, understand and validate its output and send only relevant
+information rather than complete unedited agent responses.
+
+Signed-off-by tags
+==================
+
+**The Signed-off-by tag must never be added by an AI-agent.** In
+commit messages and patches, this tag indicates acceptance of the
+Developer Certificate of Origin - it confirms your right to submit the
+contribution under the appropriate open source license. It is your
+responsibility to add this tag, either manually or via Git
+configuration, when sending patches.
+
+Patch upstreaming
+=================
+
+**Patches against upstream software components must comply with any
+relevant AI-assisted contribution policies of the upstream project**.
+This enables patches to be submitted upstream and helps us to maintain
+good relationships with upstream projects.
+
+Transparency
+============
+
+**Contributors need to disclose where they have used AI-generated output
+in their submissions to the project**. As stated above, incidental or
+trivial use of AI-generated output within an otherwise human authored
+submission doesn’t require disclosure - but if in doubt, err on the side
+of disclosing the use of AI tools.
+
+The use of generative AI and LLMs in software development is a rapidly
+evolving field. Many questions around this technology are not yet
+settled, including the copyright status of AI-generated content and the
+biases or inclinations of these tools. Within the Yocto Project we need
+to be able to determine which contributions include non-trivial
+AI-generated content and which do not. Experience shows LLM patches have
+different review requirements to human ones. We also need to be able to
+evaluate the impact of AI-generated submissions on the project over
+time.
+
+In patches and commits
+----------------------
+
+**Where AI-generated code is contributed to the project, commit messages
+must include the ``AI-Generated`` tag identifying the AI tool or
+framework and the specific AI model used**. We encourage contributors to
+be as specific as they can be. For example::
+
+    AI-Generated: Claude Code, Opus 5.0
+
+Or::
+
+    AI-Generated: Copilot, GPT-5.5
+
+Note that this policy applies where commit messages are AI-generated as
+well as where the code change itself is AI-generated.
+
+Where a patch is a mix of human authored and AI-generated content, it
+may be helpful to briefly explain which parts are tool generated in
+addition to using the ``AI-Generated`` tag.
+
+In emails, bug reports and security reports
+-------------------------------------------
+
+**Where AI-generated output is used in emails, bug reports or security
+reports, disclosure is also required.** In this case there is not a
+standard or convention to follow, but disclosure must be clear. You may
+wish to use the ``AI-Generated`` tag, or simply include a sentence to
+say that the contribution is AI-generated.
+
+Fully automated contributions
+=============================
+
+**The project will not accept automated contributions which rely
+completely on AI generation without any significant human involvement,
+judgement or review.**
+
+Exceptions to this policy may be considered by the Yocto Project
+Technical Steering Committee (TSC).
+
+Privacy and confidentiality
+===========================
+
+**Avoid sending private or confidential information (including embargoed
+information about security vulnerabilities) as input to AI-assistants
+operated as-a-Service by untrusted third parties.**
+
+Many AI-assistant or agent tools are hosted by a service provider and
+accessed over the internet. Always bear in mind when interacting with
+such an AI-assistant that you are communicating with a third-party
+organisation who may have access to the full history of your
+interactions with the tool.
+
+Enforcement
+===========
+
+Violations of this policy may result in contributions being rejected or
+deleted as appropriate. Repeated violations will be dealt with through
+the project’s `Code of Conduct`_ policy.
+
+.. _Linux Foundation Generative AI Policy: https://www.linuxfoundation.org/legal/generative-ai
+.. _Code of Conduct: https://www.yoctoproject.org/code-of-conduct
diff --git a/documentation/contributor-guide/index.rst b/documentation/contributor-guide/index.rst
index b374cc1c43ec..8b611787be0b 100644
--- a/documentation/contributor-guide/index.rst
+++ b/documentation/contributor-guide/index.rst
@@ -22,5 +22,6 @@ this.
    report-defect
    recipe-style-guide
    submit-changes
+   ai-assisted-contribution-policy
 
 .. include:: /boilerplate.rst
diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 589545074907..56e4250430fe 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -848,53 +848,3 @@ branches in both the "openembedded-core" and "meta-yocto" repositories.
 Other layers may have similar testing branches but there is no formal
 requirement or standard for these so please check the documentation for the
 layers you are contributing to.
-
-Acceptance of AI Generated Code
-===============================
-
-The Yocto Project and OpenEmbedded follow the guidance of the Linux Foundation
-in regards to the use of generative AI tools. See:
-https://www.linuxfoundation.org/legal/generative-ai.
-
-All of the existing guidelines in this document are expected to be followed,
-including in the :doc:`/contributor-guide/recipe-style-guide`, and contributing the changes with
-additional requirements to the items in section
-:ref:`contributor-guide/submit-changes:Implement and commit changes`.
-
-All AI Generated Code must be labeled as such in the commit message,
-prior to your ``Signed-off-by`` line. It is also strongly recommended,
-that any patches or code within the commit also have a comment or other
-indication that this code was AI generated.
-
-For example, here is a properly formatted commit message::
-
-   component: Add the ability to ...
-
-   AI-Generated: Uses GitHub Copilot
-
-   Signed-off-by: Your Name <your.name@domain>
-
-The ``Signed-off-by`` line must be written by you, and not the AI helper.
-As a reminder, when contributing a change, your ``Signed-off-by`` line is
-required and the stipulations in the `Developer's Statement of Origin
-1.1 <https://developercertificate.org/>`__ still apply.
-
-Additionally, you must stipulate AI contributions conform to the Linux
-Foundation policy, specifically:
-
-#. Contributors should ensure that the terms and conditions of the generative AI
-   tool do not place any contractual restrictions on how the tool's output can
-   be used that are inconsistent with the project's open source software
-   license, the project's intellectual property policies, or the Open Source
-   Definition.
-
-#. If any pre-existing copyrighted materials (including pre-existing open
-   source code) authored or owned by third parties are included in the AI tool's
-   output, prior to contributing such output to the project, the Contributor
-   should confirm that they have permission from the third party
-   owners -- such as the form of an open source license or public domain
-   declaration that complies with the project's licensing policies -- to use and
-   modify such pre-existing materials and contribute them to the project.
-   Additionally, the contributor should provide notice and attribution of such
-   third party rights, along with information about the applicable license
-   terms, with their contribution.

---
base-commit: 7b54854d12f3f2c909727702d39066a3d22a4a40
change-id: 20261102-ai-policy-14ff2516e760

Best regards,
--  
Paul Barker

