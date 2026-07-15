Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07811C44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 14:44:17 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7394.1784126650711986636
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Jul 2026 07:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DpZdJ7hm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so4979745e9.2
        for <docs@lists.yoctoproject.org>; Wed, 15 Jul 2026 07:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784126649; x=1784731449; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G1FedOuz7lE5KsiG/iEokAiDT6VifcygB1pNKRoCo+Q=;
        b=DpZdJ7hmb+RSVRtagr2xqWYeQvv7CIz2ncPyliwni6G8h+NvJqHJDkV6cSXUGBH7st
         RDHteZnHfK4vLTW1Q1fpifw6v1sP/q+FdEjM6oN1nHahlxWP37LdO+zeBzexiZ9NegvJ
         GsO9Tg+ppghrj0Y4PAz59UksUF759RgNzQylk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784126649; x=1784731449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G1FedOuz7lE5KsiG/iEokAiDT6VifcygB1pNKRoCo+Q=;
        b=en/szc/s10GqfUoG/w7K+Y41Blll18EwBF92u1jWX1PlRLXujkxx/ahOVb/5fHJ3cE
         C4Uu1K8KJog2U1VLTWwsHYW7fjDd6P722j+e2hvRyRIdS8m16k3Hm0s49Y/IiQ2VWQZe
         1U4d1wmLW+xLlFY5WHcPPPA+FoGImLbq4dHmbFK+W96B5eM1eO9z8HXtX59ylmiP1tmj
         1zdDACfDlrLhnkYPPl136guXkvMhVUzt1/R5pUVjqAPnzUCrE8ZHapkHhy47OKvOSBAY
         KlkWdeXSLd6FJ+E5a81zUU2WGdtYBlFPwAKd00+zfimGdZ9jcL4cq8ggwNF9Wshlsc9x
         GPIA==
X-Gm-Message-State: AOJu0Yzs/arleHAPRC8FE+UJU2CWW2nOy4maEm1MA9sKnQfaFvd6xgiG
	1hDMWbxR9nbhJ+LGK2hyX6JgKXemr4V4wnl0kTRGpus//udfZHaZDIG50vdL8OZglFKLHRIsNJV
	zYIpEm6U=
X-Gm-Gg: AfdE7cks0Hr+jIwTDn1taghh5Jtmc9bgNVJk2he4c4UdsMWBBrjNSt62+xZHtlCyiSW
	i0eflMK5pP+NFJ6LDy6BE7yu+EnsriH+a5q8Tvte0fupx2ZX3N3Nbd4tR+lefWvoy50qo8mXsaE
	vIAqZ8A8FZAGZ+xXotvH8wSh4otKAsawgpaHnfqClUrZVr0DEkeCv1DQifZDSTJRUyc50e4d18P
	za1piFbsu5IE99oQmwAnxwBfTShE67mrJRDjErhwMlnngeVdKX6OAdMYDA2Gnvfnh6epv0Mdybx
	ee9FrgFrBvXovdVeTD7roufusUvil34NDfI+kTcpolIS+mePfx1qJwknocVwECTgh/5P+Jc/AIO
	L9nlJnfwVc4DXHrOQlPlzNkXqYhmoscz83ANjMaFekU4iWvHaaKAGyBHRDpSEcWjnUxRhbORq3g
	yLEfN+tO+eUxcgRysDNrPbyCh/lkixOaFlnS4Y50Kl
X-Received: by 2002:a05:600c:a40c:b0:493:ee4d:5c5d with SMTP id 5b1f17b1804b1-493f882cb8cmr132618435e9.31.1784126647999;
        Wed, 15 Jul 2026 07:44:07 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5a0a:3c85:b151:b19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4953c599049sm49782525e9.0.2026.07.15.07.44.06
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:44:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] governance: Add start of project history and leadership sections
Date: Wed, 15 Jul 2026 15:44:04 +0100
Message-ID: <20260715144404.753400-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Jul 2026 14:44:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10077

I've felt for a long time we should have some of the project history written
down. The number of people who were there for some of this is decreasing and
memories do fade with time. It can be useful for others to understand how we
end up where we are today.

I've given this my best shot at starting to document what happened. I've focused
on the things I'm willing/able to share and therefore some of this does involve
me, that is inevitable. I am more than happy for others to balance this out
from other perspectives! I haven't wanted to speak for others.

I've also included a list of who held which project leadership positions over
time since that information is also at risk of being lost. If I've missed
anything or got anything wrong, sorry and please help us improve it.

I've called this "goverance" as we intend to add a bit more information about
how the project works too, but that still needs to be written. I've tried to
make the structure ready to accept it though.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/governance/history.rst    | 327 ++++++++++++++++++++++++
 documentation/governance/index.rst      |  14 +
 documentation/governance/leadership.rst |  78 ++++++
 documentation/index.rst                 |   1 +
 4 files changed, 420 insertions(+)
 create mode 100644 documentation/governance/history.rst
 create mode 100644 documentation/governance/index.rst
 create mode 100644 documentation/governance/leadership.rst

diff --git a/documentation/governance/history.rst b/documentation/governance/history.rst
new file mode 100644
index 000000000..9b63fdbbf
--- /dev/null
+++ b/documentation/governance/history.rst
@@ -0,0 +1,327 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+***************
+Project History
+***************
+
+This history represents the information people have felt able to submit to the
+documentation and is inteneded to be factual. Input from others is welcomed to
+help broaden the perspectives.
+
+
+Why does it matter?
+====================
+
+The Yocto Project has now been around long enough that not everyone remembers
+how and why it was created, what decisions were made at the time, who was
+involved, why and so on. Whilst it is important to be future looking and at
+times embrace change, it can also be useful to understand how and why things
+are as they are and the context for them. An idea of what has been tried
+before, what worked and what didn't can be helpful to guide future changes.
+
+This history section of the manual is intended to document some of what
+happened and why, so those who are interested but weren't there can see some
+of what happened and benefit from those experiences.
+
+    "Those that fail to learn from history are doomed to repeat it."
+
+Prehistory
+==========
+
+The Yocto Project is based on OpenEmbedded as it's build system. It is worth
+a few lines to mention the background. Around 2003, there were new cutting
+edge devices, "PDA"s on the market, such as Compaq iPaqs and the Sharp
+Zaurus. They had high resolution displays, touchscreens and ran Linux.
+
+Project such as Buildroot (a makefile based build system) could build
+software for them but a group of people decided that it might be possible to
+improve on the makefile approach. 'oemake' was created as a prototype,
+quickly splitting into 'bitbake' and 'openembedded' with the concept of
+recipes and classes being established.
+
+There were multiple reasons for moving from buildroot. It was felt that a
+dedicated tool and file format might allow more flexibility. A single syntax
+issue could take out a whole makefile based system. There was a feeling that
+there should be a way to share commonality between devices more easily.
+There was also interest in taking on board some of the ideas from Portage.
+There was also interest in supporting package management which buildroot at
+the time did not.
+
+There were soon several distributions built using this new system, Angstrom,
+OpenZaurus and Familiar Linux being some examples. OpenedHand, a small
+London consultancy, took OE and partially forked it to create Poky, an
+example of taking OE and using it for devices and more commercial use. It
+took OpenEmbedded but tweaked the rough edges off and aimed to create a more
+stable version.
+
+OpenEmbedded 'classic' was a monolithic repository which many people
+committed changes to, maintained originally using BitKeeper, then Monotone.
+Since the project had so far grown organically, a big open question was how
+the community could make a decision, particularly in the case of
+disagreement and conflict. This applied to simple things like a patch and
+complex areas like overall project direction.
+
+Amongst other things, "classic OE" contained multiple different versions of
+each software component, supported ipkg as it's package manager, had
+separate install steps for the target install and the staging area and had
+one monolithic staging area shared by all pieces of software. Bitbake was
+single threaded and would decide what it would execute next after the
+current recipe finished executing.
+
+In an attempt to put structure around the project, the OpenEmbedded e.V. was
+founded with a membership of interested individuals. The organisation then
+formed a Technical Steering Committee (TSC) with the power to make technical
+decisions and guide direction.
+
+One key learning from this experience was that the TSC was a good way
+handle last resort decisions but there was also a pressure for it to become
+a problem solver technical engineering body. This was not something it was
+resourced to do, being composed of effectively volunteers. It has had to be
+clear about this and ensure people have realistic expectations of it.
+
+Yocto Project Formation
+========================
+
+OpenEmbedded Classic did many things well but there were challenges and it
+struggled for effective commercial usage. OpenEmbedded had several developer
+meetings (OEDEMs) in Berlin and in Cambridge and the huge potential was
+clear to the developers but nobody could work out how to unlock it. OE has a
+small budget, huge potential but needed development in several key areas,
+they were known and extensively discussed at the meetings but resourcing
+that development was proving prohibitive. There wasn't a good mechanism for
+commercial organisations to work effectively with OE, the gap between a
+relatively adhoc volunteer organisation and big tech companies was large and
+they didn't understand each other.
+
+In 2008, Intel acquired OpenedHand and also Wind River. Intel's Open Source
+Technology centre (OTC) was growing, Intel had an interest in the embedded
+space and the idea of standardising the embedded space a little came up.
+
+There were meetings in the bay area where key leaders/companies got
+together under invitation from the Linux Foundation and Richard Purdie put
+the idea forward that collaborating together and reducing effort by sharing
+work was possible and that he could see a way it could happen.
+
+An understanding was reached between a number of founding members on how
+this collaboration could work. One key desire from many of those members
+was to have Richard Purdie lead the effort and to do so from a position of
+neutrality. As a result, Richard Purdie became a Linux Foundation Fellow,
+recognising this role.
+
+At this time, the initiative didn't have a name but this was the genesis of
+what became the Yocto Project, commonly thought of as the second
+collaborative project formed at the Linux Foundation after the kernel
+itself.
+
+Development initially happened quietly, taking the Poky project from
+OpenedHand, now owned by Intel and turning it into an example of what
+OpenEmbedded could become.
+
+At the Embedded Linux Conference in Europe (ELC-E) in Cambridge in October
+2010, this example was shown to the world, including the wider OpenEmbedded
+community to a mixed reception. The idea and direction were generally thought
+positively of but there were significant concerns about large companies
+overwhelming what was a community built effort.
+
+As a sign that the community really did matter and was important to the
+project, the initial release was 0.9, specifically making the point that it
+was a starting point, not a done deal.
+
+Significant discussion then happened between the Yocto Project and
+OpenEmbedded, with the OE TSC being empowered to lead those discussions. One
+of the issues was the monolithic openembedded monotone repository which
+many different people made commits to, sometimes conflicting, with no real
+testing of anything other than the committer's own use case.
+
+After much discussion it was agreed that:
+
+- openembedded would adopt a layer model to help scaling
+- monotone would be replaced by git
+- poky as it was then became "openembedded-core" as it was close to what was
+  needed in the new model
+- "poky" became a reference implementation, distro and test vehicle for
+  Yocto Project
+- multiple versions of recipes were dropped where possible to focus on the
+  latest versions and resolve any issues they might have, focusing
+  development after success of the approach in poky
+- the older monolithic openembedded became known as "openembedded classic"
+- a significant effort would be made to document Bitbake and OpenEmbedded to
+  help mitigate its reputation for complexity
+
+These changes met the needs of more commercially focused development and
+these items were things it was possible for the member organisations to help
+resource.
+
+Early Developments
+===================
+
+Once the dust settled from those changes, the Yocto Project development
+resources from Intel, Wind River and others contributed some key changes to
+OpenEmbedded. There were often changes talked about at many of the OE
+developer meetings (OEDEMs) but where the developers had not been able to
+find time/resources to make them happen.
+
+- fakeroot was swapped for pseudo, donated from Wind River
+- the concept of sstate was developed meaning incremental builds became
+  possible and output could be removed from the build directory structures.
+  Initial versions of this were known as "packaged staging" as initially
+  package manager involvement was assumed but this was eventually
+  discounted.
+- the separate staging and target installs were combined
+- automated testing was developed based on buildbot (python based to match
+  the core developers skillset) creating the project "autobuilder"
+- support for rpm packages were added
+
+Most of the project's budget focused either around autobuilder /
+infrastructure costs (including a full time sysadmin) or on advocacy and
+presence at events to promote the project and encourage adoption and usage.
+The project was built on the model of shared collaboration, everyone using
+it chipping in with some help to create something much greater than any one
+individual member or contributor could achieve.
+
+A key founding tenant of the Yocto Project was that each member would
+contribute resources into a central pool, so together the members could
+achieve things which would individually not be feasible. The original
+project charter did specify the contribution of a dedicated engineer from
+each member.
+
+Whilst a great intent, over time several problems were realised with this
+approach. Those engineers often only worked on things with a direct company
+interest, such as the companies own metadata layers. They would often be
+pulled off onto emergency company specific issues. It was also contractually
+near impossible to enforce the requirement, or even audit it. This only
+became clear much later.
+
+There was also a strong pressure from the Linux Foundation that it did not
+fund engineering or engineers, it provided the support for the project
+structures but that engineering came from the project members directly.
+Funding any engineering work therefore had significant push back.
+
+Development progresses
+=======================
+
+After an ELC-E where many different build systems had presentations, the
+concept of "task signatures" was added to OpenEmbedded allowing the sstate
+to be matched and reused.
+
+The idea of recipe specific sysroots was also implemented, allowing build
+isolation of components, along with host tool isolation.
+
+Binary reproducibility became an objective and the project started
+improving this with the idea that a given input should allow binary
+identical output.
+
+The project did lose access to technical writing services at Intel but
+realised the importance of the manuals so added a Platinum membership level
+to raise funds, some of which were used to pay for technical writing
+services. Intel and Texas Instruments became the first platinum members.
+
+Early Governance
+=================
+
+The early governance of the project consisted of members meetings, which
+were setup and chaired by the project's community manager, someone Intel
+provided to help the logistics of the project.
+
+Members had representatives there and members contributing resources and
+work into the project generally ended up with more significant influence on
+direction. Where specific initiatives were needed for advocacy, e.g. the
+project launch, member sponsorship was usually found. The project also
+benefited from hardware donations/sponsorship to help infrastructure for
+the 'autobuilder', the project's solution to automated testing.
+
+Specific workgroups were formed for specific topic areas. In particular, an
+advocacy team was formed to handle the project's presence at events and
+other promotional activities. There were also groups for infrastructure and
+member recruitment.
+
+Technical development was handled by Richard Purdie on behalf of Yocto
+Project working directly with the OE TSC and reporting to the members, as
+well as management at member companies.
+
+Governance changes
+===================
+
+Intel ended up providing significant developer resources that made
+significant valuable feature changes to the codebases but were also keeping
+the project going with things like recipe version updates, autobuilder
+triage and bug fixing. Whilst there were community contributions from other
+companies and individuals, people were happy to let Intel do as much as
+they were willing to. In the end, there were different priorities for Intel
+and it reduced resourcing, including reducing the time Richard Purdie could
+spend on the project. In 2018, he left Intel and became funded by the
+project directly.
+
+This necessitated several changes to the project as previously, its budget
+was not enough to employ anyone full time beyond the system administration
+it was relying upon and the limited technical writing.
+
+It was also realised that the project governance documents, charters and so
+on were relatively old fashioned. In the intervening years since it was
+formed, the Linux Foundation had worked on many more collaborative projects
+and there were things to learn from.
+
+Several new platinum members therefore joined to support these changes and a
+process of changing and updating the governance was undertaken. A workgroup
+to focus on this was formed with the aim of writing a new participation
+agreement for members. There were multiple things people wanted to achieve
+including:
+
+- Officially recognise the special relationship with OpenEmbedded
+- Have oversight of Richard Purdie's decision making
+- Creation of a Yocto Project TSC to make technical YP decisions
+- Formalise the project member benefits
+- Align the project with known LF best practise governance and charter
+  documents
+
+These changes included the formation of the Yocto Project TSC which first
+met in June 2019. The TSC became necessary since the project was now
+funding people and needed a mechanism for making technical decisions. It was
+modelled on successful elements of the OE TSC.
+
+5 Year Plan
+===========
+
+With the immediate challenges handled, the members started thinking about
+the longer term roadmap of the project and this could be summarised with the
+question "where could/should the project be in 5 years time?". It was clear
+there were some foundational pieces of work which really needed to be done
+to ensure the project's long term health and success.
+
+The project realised there were many different things it could be doing and
+decided to write down all these different things so that they could be
+defined and prioritised according to members' and project needs with the
+TSC being asked to help do this.
+
+The TSC created a document detailing ~10 different areas they felt the
+project could potentially have work done, which would have various benefits
+for the project's long term health. Having the plan was good, however the
+project did not have a way to immediately fund this work. In parallel, the
+shared collaboration model was under strain as companies all tried to
+reduce costs and do the bare minimum they needed to. This put huge strain on
+the few funded people within the project, particularly Richard, since he
+was "the maintainer of last resort" and things with no other ownership all
+fell to him.
+
+Richard ended up writing about this in a public article, `"Maintainer
+confidential: Opportunities and challenges of the ubiquitous but
+under-resourced Yocto Project" on Linux.com.
+<https://www.linux.com/news/maintainer-confidential-opportunities-and-challenges-of-the-ubiquitous-but-under-resourced-yocto-project/>`
+
+Unexpectedly after publishing it, the Sovereign Tech Fund (STF, now the
+Sovereign Tech Agency), a German government technology fund, reached out to
+the project to see if they could help. They had recognised these challenges
+in the FOSS world and wanted to help. The project showed them the 5 year
+plan, hoping to fund a few of the areas but after discussion, it was
+realised it might be possible to move the majority of them forward. The
+project sent out requests for quotations and selected various consultancies
+to help with each of the 10 different work streams that were identified,
+split into three development milestones over 9 months.
+
+The work items had been designed aiming to minimise future maintenance
+costs through extensive automated testing, improving the project long term
+maintenance burdens. The big downside to the work was only having Richard to
+oversee it, so in the short term, the burn out problem became much worse,
+the opposite hope of the work. Overall for the project, this work was a
+huge success though and moved the project forward in many different areas.
+
diff --git a/documentation/governance/index.rst b/documentation/governance/index.rst
new file mode 100644
index 000000000..f9841b78f
--- /dev/null
+++ b/documentation/governance/index.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+====================================
+Yocto Project Governance and History
+====================================
+
+.. toctree::
+   :caption: Table of Contents
+   :numbered:
+
+   history
+   leadership
+
+.. include:: /boilerplate.rst
diff --git a/documentation/governance/leadership.rst b/documentation/governance/leadership.rst
new file mode 100644
index 000000000..2bf85f87f
--- /dev/null
+++ b/documentation/governance/leadership.rst
@@ -0,0 +1,78 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+**************************
+Project Leadership History
+**************************
+
+This section records the people who held various project leadership roles over time, without them the project would not be what it is today.
+
+Yocto Project Chair
+===================
+
+- Jeffrey 'Jefro' Osier-Mixon 2010 - 2018/06
+- Lieu Ta 2018/06 - 2020/04
+- Andrew Wafaa 2020/04 - 2026/04
+- Nicolas Dechesne 2026/05 - Current
+
+Treasurer
+=========
+
+- Lieu Ta 2010 - 2020/05
+- Stephanie Moscrip 2020/05 - 2021/11
+- Steve Geary 2021/11 - 2025/05
+- Chuck Wolber 2025/05 - Current
+
+Advocacy Lead
+=============
+
+- Tracey Erway 2010 - 2018
+- Andreea Volosincu 2018 - 2021
+- Tracey Erway 2021
+- Megan Knight 2021/10 - Current
+
+Community Manager
+=================
+
+- Jeffrey 'Jefro' Osier-Mixon 2010 - 2018/06
+- Nicolas Dechesne 2018/07 - 2023/04
+- Josef Holzmayr 2023/04 - Current
+
+Infrastructure Lead
+===================
+
+- Michael Halstead 2011/06 - Current
+
+Training Lead
+=============
+
+- David Reyna 2014/10 - Current
+
+YP TSC Chair
+============
+
+- Richard Purdie 2019/03 - Current
+
+YP TSC Members
+==============
+
+- Armin Kuster 2019/03 - 2023/04
+- Khem Raj 2019/03 - 2025/05
+- Ross Burton 2019/03 - Current
+- Denys Dmytriyenko 2019/03 - Current
+- Mark Hatle 2023/04 - Current
+- Richard Purdie 2019/03 - Current
+- Joshua Watt 2025/05 - Current
+
+Linux Foundation Project Manager for Yocto Project
+==================================================
+
+- Katie Greenley 2020/05 - 2021/01
+- Neal Caidin 2021/02 - 2024/08
+- Ben Sternthal 2024/09 - 2025/01
+- Jennifer Bonner 2025/01 - 2025/07
+- Michelle Favalora 2025/08 - Current
+
+Ecosystem Engineering and Operations Lead
+=========================================
+
+- Paul Barker 2026/01 - Current
diff --git a/documentation/index.rst b/documentation/index.rst
index 46b775711..bd309ad6e 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -35,6 +35,7 @@ Welcome to the Yocto Project Documentation
    Application Development and the Extensible SDK (eSDK) <sdk-manual/index>
    Toaster Manual <toaster-manual/index>
    Test Environment Manual <test-manual/index>
+   Governance and History <governance/index>
    bitbake
 
 .. toctree::

