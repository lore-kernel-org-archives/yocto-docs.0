Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.23167.1617031778215112976
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Mar 2021 08:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Vaxyl7LV;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id x126so10050894pfc.13
        for <docs@lists.yoctoproject.org>; Mon, 29 Mar 2021 08:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7WogE9TSRnSrbk0R5ILLnnFDlWjxL6UPL+xi16KRIow=;
        b=Vaxyl7LVKjTnjIS4P5/iBLpj6d2a6fyR43WiT3u8Pk/TZYIj5BfO1R1/VRH14J1nOp
         R8czrdP4PIm50tHx50QG35ykKECJmPQCrL1/FSOQyFitv9+plRB2RVpgJZvH8Wl5mPeA
         fHDrlt0tnnehIYPPgNHmOK35TnUS+m4gUYOTxc6c1iGwLMbfNVs0/Z5Lo0dI5C75rfF1
         PfGs8uMMU8+0c+bHhm1yic+pKMlWKzo/8gT7g9l8zktBrP+ntKgYgEPYCOp80yuQVQkW
         Y2PcoPgtwkwndiQIZidGPzsKz1gJLmLFT7UTA7Af0Wc+O3BNOpRZf5rSNBPVn/hNR4KW
         Yvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=7WogE9TSRnSrbk0R5ILLnnFDlWjxL6UPL+xi16KRIow=;
        b=F5mOxILNa6JnIOJVRIUAm3Z/07EUlOSfBB1MJz/t1mW2Ic9DP/1prA91yZwbWEtpt+
         rqzpFdNSs7suqvDsrdAVGnRL6PinPlUe92dbMeIc5r/5BD7fGB9PSi1OQSqk2JKvq6qx
         zaIWEvTCehneCi8KAKiFtxhIFWaPbK4S+4zQcBAGVugmT6yogXdoEgibUwm7/H30kNlv
         YpW/GuHhE0Kn4x/CrXFc+TEk3h6SXUb4gAdsppdFpYXmdCaUJapV0qg+pywBj2cf6VGh
         PMbmfPyUKKzmXM/wmLlizZzqfzzIKUtJO/+nQj3GN4okwd+pBklSDwOhubfRkwuZ27vl
         IuOg==
X-Gm-Message-State: AOAM530KjHcbSx7VStrJZ8Ql6RjRnoA9d98xbFCbq1GQ0b+obW2eIubf
	pAou9Xn85WgveQ6oYN+qdKUsqLB4FeoASQ==
X-Google-Smtp-Source: ABdhPJwlPQ0U1yPIXj0W3ln7PDAweXJnTM9tDBdXB8UHiOP28IZHU229N+Uqe6fZVjfHZ2W+UjDF0g==
X-Received: by 2002:a63:ab05:: with SMTP id p5mr24520492pgf.149.1617031777382;
        Mon, 29 Mar 2021 08:29:37 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:4986:10f4:29b0:2119? ([2601:646:9200:a0f0:4986:10f4:29b0:2119])
        by smtp.gmail.com with ESMTPSA id s28sm17791339pfd.155.2021.03.29.08.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Mar 2021 08:29:36 -0700 (PDT)
Subject: Re: [docs] [PATCH v2] UBUNTU sudo apt git instead of git-core
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 Janne Kiiskila <janne.kiiskila@pelion.com>,
 "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
References: <DBAPR08MB55580B8D8BF0C1EFBB404545F3639@DBAPR08MB5558.eurprd08.prod.outlook.com>
 <9b3174bf-eb43-c78f-f6ce-abf3c3a9ff4b@gmail.com>
 <db56367c-76cb-0ad0-384a-24ac2f8bce3a@bootlin.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <4b1c77f3-dbb9-9f6c-b6f3-e57622194bf1@gmail.com>
Date: Mon, 29 Mar 2021 08:29:35 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <db56367c-76cb-0ad0-384a-24ac2f8bce3a@bootlin.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Michael

On 3/29/21 8:14 AM, Michael Opdenacker wrote:
> Khem, Janne,
> 
> On 3/24/21 7:24 PM, Khem Raj wrote:
>>
>> perhaps we should install git-all instead that would be same across
>> debian-like and redhat-like distros across multiple releases.
> 
> 
> I'm OK for both changes, but isn't the second one a bit overkill?

yes git-all option is overkill, I replied to this before as well to drop 
this idea. but I guess only replied to Janne, patch is ok as it is


> 
> On my Ubuntu 20.04 system, installing "git-all" results in installing
> many packages:
> 
> sudo apt install git-all
> Reading package lists... Done
> Building dependency tree
> Reading state information... Done
> The following additional packages will be installed:
>    cvsps dh-elpa-helper elpa-dash elpa-ghub elpa-git-commit elpa-let-alist elpa-magit elpa-magit-popup elpa-treepy elpa-with-editor git-cvs git-daemon-run git-doc git-el git-mediawiki git-svn gitweb libclass-inspector-perl
>    libclass-singleton-perl libcommon-sense-perl libdatetime-format-builder-perl libdatetime-format-iso8601-perl libdatetime-format-strptime-perl libdatetime-locale-perl libdatetime-perl libdatetime-timezone-perl
>    libdbd-sqlite3-perl libdbi-perl libfile-sharedir-perl libjson-perl libjson-xs-perl libmediawiki-api-perl libsvn-perl libtypes-serialiser-perl libyaml-perl runit
> Suggested packages:
>    mediawiki libclone-perl libmldbm-perl libnet-daemon-perl libsql-statement-perl libyaml-shell-perl
> The following NEW packages will be installed:
>    cvsps dh-elpa-helper elpa-dash elpa-ghub elpa-git-commit elpa-let-alist elpa-magit elpa-magit-popup elpa-treepy elpa-with-editor git-all git-cvs git-daemon-run git-doc git-el git-mediawiki git-svn gitweb
>    libclass-inspector-perl libclass-singleton-perl libcommon-sense-perl libdatetime-format-builder-perl libdatetime-format-iso8601-perl libdatetime-format-strptime-perl libdatetime-locale-perl libdatetime-perl
>    libdatetime-timezone-perl libdbd-sqlite3-perl libdbi-perl libfile-sharedir-perl libjson-perl libjson-xs-perl libmediawiki-api-perl libsvn-perl libtypes-serialiser-perl libyaml-perl runit
> 0 upgraded, 37 newly installed, 0 to remove and 15 not upgraded.
> Need to get 6,879 kB of archives.
> After this operation, 55.9 MB of additional disk space will be used.
> 
> IMHO, the drawback of using "git-all" is that we look track of which git
> components we release need. This would make the documentation more vague
> in terms of software requirements.
> 
> Does this make sense ?
> 
> Thanks again,
> 
> Michael.
> 
