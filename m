Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.2304.1618342344421280989
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 12:32:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from [::1] (port=33728 helo=cpanel8.indieserve.net)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lWOlq-008j9r-0C; Tue, 13 Apr 2021 15:32:22 -0400
Received: from [136.2.16.185] ([136.2.16.185]) by crashcourse.ca (Horde
 Framework) with HTTPS; Tue, 13 Apr 2021 15:32:21 -0400
Date: Tue, 13 Apr 2021 15:32:21 -0400
Message-ID: <20210413153221.Horde.Vm23gLYUW3_ZXR1Vyn-DAjC@crashcourse.ca>
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Janne Kiiskila <janne.kiiskila@pelion.com>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH]Variables - WKS_FILE tip finding one used
References: <DBAPR08MB5558B9EA79319C4C09AC1802F3709@DBAPR08MB5558.eurprd08.prod.outlook.com>
 <266de944-aab4-2e1d-021f-d722d15339e3@bootlin.com>
 <4788fc62-112d-b2cb-2292-e87a6282a214@crashcourse.ca>
 <3b3e763c-7e0b-611d-2b45-2c917aaa0537@bootlin.com>
In-Reply-To: <3b3e763c-7e0b-611d-2b45-2c917aaa0537@bootlin.com>
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Disposition: inline


Quoting Michael Opdenacker <michael.opdenacker@bootlin.com>:

> Janne, Robert,
>
> On 4/13/21 11:32 AM, Robert P. J. Day wrote:
>>
>>   while this is undeniably useful information, the same tip could be
>> added to pretty much every variable in the variable glossary, so i'm
>> not sure we want to start doing that; i think it would be far more
>> useful to make this a general hint somewhere.
>>
>>   i also recall, from years gone by, that chris larson had a cool
>> utility named "bb" that would search in a *proper* way for the values
>> of variables by actually digging into the data dictionary, rather than
>> the clearly hackier way of grep'ing through the output of "bitbake
>> -e".
>
>
> Thanks for your contribution and review (respectively).
>
> Do others have opinions about such a change? It would help to make a
> decision...
>
> Thanks in advance for jumping in...

   the other problem (i could have mentioned) is that that particular
grep incantation has the obvious flaw that it will not find variables
that are not at the beginning of the line, and that represents all of
those variables that are prefixed by "export":

export AR="aarch64-wrs-linux-gcc-ar"
export AS="aarch64-wrs-linux-as "
export BUILD_AR="ar"
export BUILD_AS="as "
export BUILD_CC="gcc "
export BUILD_CCLD="gcc "
export  
BUILD_CFLAGS="-isystem/home/rday51/repos/wrlinux/wrlinux/build/tmp-glibc/work/cortexa53-wrs-linux/defaultpkgname/1.0-r0/recipe-sysroot-native/usr/include -O2  
-pipe"
export BUILD_CPP="gcc  -E"
export  
BUILD_CPPFLAGS="-isystem/home/rday51/repos/wrlinux/wrlinux/build/tmp-glibc/work/cortexa53-wrs-linux/defaultpkgname/1.0-r0/recipe-sysroot-native/usr/include"
export BUILD_CXX="g++ "
export  
BUILD_CXXFLAGS="-isystem/home/rday51/repos/wrlinux/wrlinux/build/tmp-glibc/work/cortexa53-wrs-linux/defaultpkgname/1.0-r0/recipe-sysroot-native/usr/include -O2  
-pipe"
export BUILD_FC="gfortran "
export BUILD_LD="ld "
... and on and on ...

WKS_FILE is fine, of course, but it would be dangerous to
generalize this trick without the appropriate warning.

rday

