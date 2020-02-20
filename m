Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.5315.1582204757602746638
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Feb 2020 05:19:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from [127.0.0.1] (port=53780 helo=cpanel7.indieserve.net)
	by cpanel7.indieserve.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1j4ljY-00C7dV-1Q
	for docs@lists.yoctoproject.org; Thu, 20 Feb 2020 08:19:16 -0500
Received: from [66.129.241.13] ([66.129.241.13]) by crashcourse.ca (Horde
 Framework) with HTTPS; Thu, 20 Feb 2020 08:19:15 -0500
Date: Thu, 20 Feb 2020 08:19:15 -0500
Message-ID: <20200220081915.Horde.sJ-6K8zWDpPhSD8lh3-cbjd@crashcourse.ca>
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
To: docs@lists.yoctoproject.org
Subject: Re: [docs] "KBUILD_DEFCONFIG" description in kernel-dev manual seems wrong
References: <alpine.LFD.2.21.2002200346570.15458@localhost.localdomain>
 <CADkTA4OcvgoJE8ksdjFtQOLYnyaPRXGJXHeY3iDd9ooPD00Knw@mail.gmail.com>
In-Reply-To: <CADkTA4OcvgoJE8ksdjFtQOLYnyaPRXGJXHeY3iDd9ooPD00Knw@mail.gmail.com>
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Disposition: inline
Content-Transfer-Encoding: 8bit


Quoting Bruce Ashfield <bruce.ashfield@gmail.com>:

> On Thu, Feb 20, 2020 at 3:53 AM rpjday@crashcourse.ca
> <rpjday@crashcourse.ca> wrote:
>>
>>
>>   in current kernel-dev manual, section on "in-tree" defconfig file:
>>
>> https://www.yoctoproject.org/docs/current/kernel-dev/kernel-dev.html#using-an-in-tree-defconfig-file
>>
>> the example given is:
>>
>>  KBUILD_DEFCONFIG_common-pc ?=  
>> "/home/scottrif/configfiles/my_defconfig_file"
>>
>> but that's not an "in-tree" file, is it? i thought that variable
>> referred to just the file name within an existing kernel source tree,
>> no? the processing in kernel-yocto.bbclass certainly suggests that:
>
> Correct. It is for defconfigs that are shipped with the kernel itself.
> The standard 'defconfig' in the SRC_URI covers other cases.

   thought so … will fix.

rday



