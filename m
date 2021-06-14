Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web12.7.1623688165160237416
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Jun 2021 09:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 38B0E1BF205;
	Mon, 14 Jun 2021 16:29:22 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Subject: [master] Pull request
Organization: Bootlin
Message-ID: <7c786530-7332-8e0e-bdef-13adcea01ca3@bootlin.com>
Date: Mon, 14 Jun 2021 18:29:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

The following changes since commit adab5d0047354b5a1b11c2ece48abd8f295f69b0:

  Remove Clutter references (2021-06-04 11:00:55 +0200)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs master-next
  http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=master-next

for you to fetch changes up to 92f17a0ac68a64c86fa46ffbcec7acb3de3b23bf:

  releases: put release number after "Release Series" (2021-06-14
18:20:52 +0200)

----------------------------------------------------------------
Daniel Wagenknecht (5):
      ref-manual: variables: update examples refering to DEPLOY_DIR_IMAGE
      ref-manual: variables: document IMGDEPLOYDIR
      ref-manual: migration-2.2: add note about IMGDEPLOYDIR
      ref-manual: variables: fixup example in IMAGE_CMD
      ref-manual: variables: fixup class reference in IMAGE_MANIFEST

Michael Opdenacker (4):
      manuals: fix epub export warnings
      ref-manual: move migration guides to separate document
      releases: clarify supported and outdated releases
      releases: put release number after "Release Series"

Quentin Schulz (1):
      documentation: Makefile: turn warnings into errors by default

Richard Purdie (2):
      test-manual: add initial reproducible builds documentation
      test-manual: Add initial YP Compatible documentation

 documentation/Makefile                                                
|   2 +-
 documentation/conf.py                                                 
|   3 ++
 documentation/index.rst                                               
|   1 +
 documentation/{ref-manual/migration.rst => migration-guides/index.rst}
|  48 ++++++++++++++++---------------
 documentation/{ref-manual => migration-guides}/migration-1.3.rst      
|   4 +--
 documentation/{ref-manual => migration-guides}/migration-1.4.rst      
|   6 ++--
 documentation/{ref-manual => migration-guides}/migration-1.5.rst      
|   4 +--
 documentation/{ref-manual => migration-guides}/migration-1.6.rst      
|   4 +--
 documentation/{ref-manual => migration-guides}/migration-1.7.rst      
|   4 +--
 documentation/{ref-manual => migration-guides}/migration-1.8.rst      
|   4 +--
 documentation/{ref-manual => migration-guides}/migration-2.0.rst      
|   4 +--
 documentation/{ref-manual => migration-guides}/migration-2.1.rst      
|   6 ++--
 documentation/{ref-manual => migration-guides}/migration-2.2.rst      
|  19 ++++++++++---
 documentation/{ref-manual => migration-guides}/migration-2.3.rst      
|   4 +--
 documentation/{ref-manual => migration-guides}/migration-2.4.rst      
|   4 +--
 documentation/{ref-manual => migration-guides}/migration-2.5.rst      
|   4 +--
 documentation/{ref-manual => migration-guides}/migration-2.6.rst      
|   6 ++--
 documentation/{ref-manual => migration-guides}/migration-2.7.rst      
|   4 +--
 documentation/{ref-manual => migration-guides}/migration-3.0.rst      
|   4 +--
 documentation/{ref-manual => migration-guides}/migration-3.1.rst      
|   4 +--
 documentation/{ref-manual => migration-guides}/migration-3.2.rst      
|   4 +--
 documentation/{ref-manual => migration-guides}/migration-3.3.rst      
|   4 +--
 documentation/{ref-manual => migration-guides}/migration-general.rst  
|   0
 documentation/ref-manual/index.rst                                    
|   1 -
 documentation/ref-manual/release-process.rst                          
|   6 ++--
 documentation/ref-manual/variables.rst                                
|  29 +++++++++++++++----
 documentation/releases.rst                                            
|  62 ++++++++++++++++++++--------------------
 documentation/test-manual/index.rst                                   
|   2 ++
 documentation/test-manual/reproducible-builds.rst                     
| 135
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 documentation/test-manual/yocto-project-compatible.rst                
| 124
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 30 files changed, 402 insertions(+), 104 deletions(-)
 rename documentation/{ref-manual/migration.rst =>
migration-guides/index.rst} (56%)
 rename documentation/{ref-manual => migration-guides}/migration-1.3.rst
(98%)
 rename documentation/{ref-manual => migration-guides}/migration-1.4.rst
(98%)
 rename documentation/{ref-manual => migration-guides}/migration-1.5.rst
(99%)
 rename documentation/{ref-manual => migration-guides}/migration-1.6.rst
(99%)
 rename documentation/{ref-manual => migration-guides}/migration-1.7.rst
(98%)
 rename documentation/{ref-manual => migration-guides}/migration-1.8.rst
(98%)
 rename documentation/{ref-manual => migration-guides}/migration-2.0.rst
(98%)
 rename documentation/{ref-manual => migration-guides}/migration-2.1.rst
(99%)
 rename documentation/{ref-manual => migration-guides}/migration-2.2.rst
(95%)
 rename documentation/{ref-manual => migration-guides}/migration-2.3.rst
(99%)
 rename documentation/{ref-manual => migration-guides}/migration-2.4.rst
(99%)
 rename documentation/{ref-manual => migration-guides}/migration-2.5.rst
(99%)
 rename documentation/{ref-manual => migration-guides}/migration-2.6.rst
(99%)
 rename documentation/{ref-manual => migration-guides}/migration-2.7.rst
(98%)
 rename documentation/{ref-manual => migration-guides}/migration-3.0.rst
(99%)
 rename documentation/{ref-manual => migration-guides}/migration-3.1.rst
(98%)
 rename documentation/{ref-manual => migration-guides}/migration-3.2.rst
(99%)
 rename documentation/{ref-manual => migration-guides}/migration-3.3.rst
(98%)
 rename documentation/{ref-manual =>
migration-guides}/migration-general.rst (100%)
 create mode 100644 documentation/test-manual/reproducible-builds.rst
 create mode 100644 documentation/test-manual/yocto-project-compatible.rst

Thank you in advance,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

