Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.1341.1594161291257523923
 for <docs@lists.yoctoproject.org>;
 Tue, 07 Jul 2020 15:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=bp6jjFkz;
 spf=pass (domain: konsulko.com, ip: 209.85.128.65, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f65.google.com with SMTP id q15so888766wmj.2
        for <docs@lists.yoctoproject.org>; Tue, 07 Jul 2020 15:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=mWp0YTaF7KN3zIew6lEp9T8yhg996KImzvtr0MQmDUA=;
        b=bp6jjFkzONGZlJQoFhF8az194pwYfCr0Af8I56hOIQe3B94bngxfp7f2BIECFgGWWD
         gTbNGI2UqcpeQeVoEgq88LtmUXlbg/BqGyD+owWydrhlbUcW+6hUpT4eX4PPMQKsp+Fu
         bbqZ3jT+dl0ygC8//hDJPZepgv8sB6iyZwQSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=mWp0YTaF7KN3zIew6lEp9T8yhg996KImzvtr0MQmDUA=;
        b=LEcdi1SJWxM6+80d5IQqXjloynfp6ICW0+Tg1aBq7wSUU2ptyXi7flETEk+Ke6na08
         EGeU1uar5VlAunz/dsQ53uUwmw/heeJX8RqeNXVz/TpbNPlRvPIIHdRcH3anvIUqK2qf
         /rfHphFV3y3qjXKVhvnuk45G9XT/WJPPrp0UfneSx3QMcc3vCL3IBhaVI0MMAQsP5DyH
         HkasmCr/FE3e/j2KgdyLSveeC7SDaUJVuPtp8Jjnd6eGFzvxoXRvDESoW0pLCPjdjYHP
         nysWccZaSGeqa6/261S/IP0jsff5BJmoDzUNt8fbNQCci3MaWANZkAzl22yHnfySy5Tq
         DzjA==
X-Gm-Message-State: AOAM5304mdscoZs+2GVpBr3tqCwJRmxsywGeyGWrqjwiYI9pyMPIicX7
	YyuVsIOV74uxzOuhLEr9T17I2IW2Cec=
X-Google-Smtp-Source: ABdhPJye964lGRJz6xm3XqKZcXXOHrmo0+yTgwFUBkdYVRwQhEAjUIjW0AeXHwB42IwNxtxcgaLE+g==
X-Received: by 2002:a1c:65d5:: with SMTP id z204mr6142291wmb.15.1594161289418;
        Tue, 07 Jul 2020 15:34:49 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from [192.168.4.166] ([78.130.197.211])
        by smtp.gmail.com with ESMTPSA id f17sm3286260wme.14.2020.07.07.15.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2020 15:34:48 -0700 (PDT)
Subject: Re: [docs] [PATCH] documentation/poky.ent: Add screen
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
References: <20200707093632.17972-1-leon.anavi@konsulko.com>
 <f40b1190a1194109bb8c97bfaef284de@XBOX03.axis.com>
From: "Leon Anavi" <leon.anavi@konsulko.com>
Message-ID: <b8d5a28c-5607-69be-1951-a1c5d0c23706@konsulko.com>
Date: Wed, 8 Jul 2020 01:34:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <f40b1190a1194109bb8c97bfaef284de@XBOX03.axis.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Peter,

On 8.07.20 г. 1:15 ч., Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On Behalf
>> Of Leon Anavi
>> Sent: den 7 juli 2020 11:37
>> To: docs@lists.yoctoproject.org
>> Cc: Leon Anavi <leon.anavi@konsulko.com>
>> Subject: [docs] [PATCH] documentation/poky.ent: Add screen
>>
>> Add screen to the list of packages for Ubuntu. Without screen or
>> an alternative terminal, executing -c devshell fails due to the
>> following error:
>>
>> ERROR: do_devshell: No valid terminal found, unable to open devshell.
>>
>> Tested on a fresh installation of Ubuntu 18.04.4 LTS.
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>>   documentation/poky.ent | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/documentation/poky.ent b/documentation/poky.ent
>> index aec8d455e..5e3563937 100755
>> --- a/documentation/poky.ent
>> +++ b/documentation/poky.ent
>> @@ -62,7 +62,7 @@
>>   <!ENTITY UBUNTU_HOST_PACKAGES_ESSENTIAL "gawk wget git-core diffstat unzip texinfo gcc-multilib \
>>        build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
>>        xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
>> -     pylint3 xterm python3-subunit mesa-common-dev">
>> +     pylint3 xterm python3-subunit mesa-common-dev screen">
>                  ^^^^^
> Doesn't "xterm" fulfill the requirement for a valid terminal?

No, because in my case I am logging remotely to the build machine via 
SSH. Here are more details (without installed screen):

* I have xterm installed:

$ dpkg -l | grep xterm
ii  xterm 330-1ubuntu2                                     amd64        
X terminal emulator

* I am using release Dunfell:

$ git branch
* dunfell

* devshell fails:

$ bitbake u-boot -c devshell

ERROR: u-boot-1_2020.01-r0 do_devshell: No valid terminal found, unable 
to open devshell.
Tried the following commands:
     tmux split-window -c "{cwd}" "do_terminal"
     tmux new-window -c "{cwd}" -n "OpenEmbedded Developer Shell" 
"do_terminal"
     xfce4-terminal -T "OpenEmbedded Developer Shell" -e "do_terminal"
     terminology -T="OpenEmbedded Developer Shell" -e do_terminal
     mate-terminal --disable-factory -t "OpenEmbedded Developer Shell" 
-x do_terminal
     konsole --separate --workdir . -p tabtitle="OpenEmbedded Developer 
Shell" -e do_terminal
     gnome-terminal -t "OpenEmbedded Developer Shell" -- do_terminal
     xterm -T "OpenEmbedded Developer Shell" -e do_terminal
     rxvt -T "OpenEmbedded Developer Shell" -e do_terminal
     tmux new -c "{cwd}" -d -s devshell -n devshell "do_terminal"
     screen -D -m -t "OpenEmbedded Developer Shell" -S devshell do_terminal

I believe often developer login via SSH to build machines therefore it 
will be useful to have screen in the list of packages.

Best regards,
Leon

> It is already specified for all the distros, not only Ubuntu.
>
>>   <!ENTITY FEDORA_HOST_PACKAGES_ESSENTIAL "gawk make wget tar bzip2 gzip python3 unzip perl patch \
>>        diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
>>        ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
>> --
>> 2.17.1
> //Peter
>
-- 
Leon Anavi
Software Engineer
konsulko.com

