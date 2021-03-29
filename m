Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web08.23352.1617030890904271032
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Mar 2021 08:14:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: from [10.0.0.12] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 158F6240013;
	Mon, 29 Mar 2021 15:14:48 +0000 (UTC)
Subject: Re: [docs] [PATCH v2] UBUNTU sudo apt git instead of git-core
To: Khem Raj <raj.khem@gmail.com>, Janne Kiiskila
 <janne.kiiskila@pelion.com>,
 "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
References: <DBAPR08MB55580B8D8BF0C1EFBB404545F3639@DBAPR08MB5558.eurprd08.prod.outlook.com>
 <9b3174bf-eb43-c78f-f6ce-abf3c3a9ff4b@gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <db56367c-76cb-0ad0-384a-24ac2f8bce3a@bootlin.com>
Date: Mon, 29 Mar 2021 17:14:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <9b3174bf-eb43-c78f-f6ce-abf3c3a9ff4b@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Khem, Janne,

On 3/24/21 7:24 PM, Khem Raj wrote:
>
> perhaps we should install git-all instead that would be same across
> debian-like and redhat-like distros across multiple releases.


I'm OK for both changes, but isn't the second one a bit overkill?

On my Ubuntu 20.04 system, installing "git-all" results in installing
many packages:

sudo apt install git-all
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  cvsps dh-elpa-helper elpa-dash elpa-ghub elpa-git-commit elpa-let-alist elpa-magit elpa-magit-popup elpa-treepy elpa-with-editor git-cvs git-daemon-run git-doc git-el git-mediawiki git-svn gitweb libclass-inspector-perl
  libclass-singleton-perl libcommon-sense-perl libdatetime-format-builder-perl libdatetime-format-iso8601-perl libdatetime-format-strptime-perl libdatetime-locale-perl libdatetime-perl libdatetime-timezone-perl
  libdbd-sqlite3-perl libdbi-perl libfile-sharedir-perl libjson-perl libjson-xs-perl libmediawiki-api-perl libsvn-perl libtypes-serialiser-perl libyaml-perl runit
Suggested packages:
  mediawiki libclone-perl libmldbm-perl libnet-daemon-perl libsql-statement-perl libyaml-shell-perl
The following NEW packages will be installed:
  cvsps dh-elpa-helper elpa-dash elpa-ghub elpa-git-commit elpa-let-alist elpa-magit elpa-magit-popup elpa-treepy elpa-with-editor git-all git-cvs git-daemon-run git-doc git-el git-mediawiki git-svn gitweb
  libclass-inspector-perl libclass-singleton-perl libcommon-sense-perl libdatetime-format-builder-perl libdatetime-format-iso8601-perl libdatetime-format-strptime-perl libdatetime-locale-perl libdatetime-perl
  libdatetime-timezone-perl libdbd-sqlite3-perl libdbi-perl libfile-sharedir-perl libjson-perl libjson-xs-perl libmediawiki-api-perl libsvn-perl libtypes-serialiser-perl libyaml-perl runit
0 upgraded, 37 newly installed, 0 to remove and 15 not upgraded.
Need to get 6,879 kB of archives.
After this operation, 55.9 MB of additional disk space will be used.

IMHO, the drawback of using "git-all" is that we look track of which git
components we release need. This would make the documentation more vague
in terms of software requirements.

Does this make sense ?

Thanks again,

Michael.

-- 

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

