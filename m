Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA71CC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 16:25:13 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.88])
 by mx.groups.io with SMTP id smtpd.web12.308.1667838306438318196
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Nov 2022 08:25:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@theobroma-systems.com header.s=selector1 header.b=VKtJCmLw;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.88, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hxmX5ii3LITw0Gy9YmA3/PunhskejYPEEH72UOriKMZCamCS2jxoLUy3GeqYybnG8EMZsTzlVhgb7cobaCmi65kLR4HcQC84WCaZxVrD/hNzx92XOwibGzuNZzHG2HpmpFmGuGi9CtMYAPGjmjMWHZGDPpWm16qUm+2XCVdPNcCtw9MmWq+foUS0hN6Hg0MJlk+3y26Yi9AQ4Jc9sseXxLyXU2e6hyQxnFYlyKlDD8iinSowI1HKwFTWYrH9ALLGckX7w0dYfs1k/acdU0P3X671RF8iXZFOWEPyNE5aEvBJOXOUv5Cr8iPyKcJzaelhdnqMTa3sXIGTpo+o8eUzFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yhjnHhD4aPqu9+R9MR2QcLCP8zrlKdg0fPdx/mEeo4=;
 b=UDCAGMRm8zlhFprr/4hglXPTFII5CeKZaYOM4Yan9ylo0p5fNB47LVBBfC2ReSMqPpN5IhUljdkmmSUuU9Sq7zU2MjtGHM2dVQ+uc5wXGmRrvA75dgNen9ewUMxP2hYrX8Jb+C321xtj6jPdYNe12kDI7ZpR6BUpFmZ7wEf4GX29NBtwWSGL5Fr6Y3Y2NB7Z+1XLL3tfmKmKpmKTHtFaEIEBpaSpweHvCpPYGqg0OmEqg7pwXTF/LDDLvZjdnZcWKw7CgmsJARpuhkF4UUEcJXmKEaePX+fmvFjWv6oWOBYLLM5Go8cPG9HU5C/wiCwCVyktglZNSVPPsB2iWzvxww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yhjnHhD4aPqu9+R9MR2QcLCP8zrlKdg0fPdx/mEeo4=;
 b=VKtJCmLwdnNbrW7w5J6Eyg1oO7bTRl1hQqfJoLv+zNJEnPu5BBLkDzs3PEYveI3HjRG7TKDGy7/Esfj2jZ2BDBqoa09SXpHQbB7ucXq0PP+P/apIChaHjG3cTy/CSwwjUrc/BLXyo6hZWEqAzDDOBtHkKQDUl0fvuB5Gy2JLAOZTISqDoukA0Y5bwIso5JtusTTUsnw30JEMkJDNg+hXZSzF3eEbL/SDQMGjV5NJQA9vxj2maZwizsnCkDI/Od/H+fDKz80NfgoUQUCz9+6zoDK7OwQAu6qkAJJcDCkjY4zT8ApwEZIap0Vp6XSffWMY7zRyPw2s0y3jrHakle0iQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB9143.eurprd04.prod.outlook.com (2603:10a6:20b:44a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Mon, 7 Nov
 2022 16:25:03 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 16:25:03 +0000
Message-ID: <51dfb696-8663-d8dd-b269-44e28b60af1a@theobroma-systems.com>
Date: Mon, 7 Nov 2022 17:25:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [docs] YP Quick Build: errors/annoyances: ubu-22.04 docker
 container
Content-Language: en-US
To: glscene2010@gmail.com, docs@lists.yoctoproject.org
References: <2fd29235-6c93-a911-944a-f78dd7a27904@windriver.com>
 <17126.1667532189686240195@lists.yoctoproject.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <17126.1667532189686240195@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::19) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB9143:EE_
X-MS-Office365-Filtering-Correlation-Id: eaf10992-20f3-4fd6-a5ad-08dac0dc9f8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FX5YKREV1OUI2Xf1brw/c+7VJ1MktakZDbJgP6lrPJ7uXEXY1wHzf4t3dLRY33SlbqbshW6wf01FDShk3ekR/ddZGqMtbjLBeYyjC6QavNXNJCDQN33dWjWSYq2amhYuaR/DqWRVVASoyAdmofz9m+KCMqCGewpHEL+6tfX842opQJ1LlYbAQQG+ZCZR4BCpUSMIesIr5PC4hzI6cFgm+whuM4KEWgw2UwI+ploHIntphJ4r9vL8ZI/3SlTl+Eb1RDDhNJDTGF5QQpVV/ipGM0ThwAv+pk2wdHaz2bRTSZmgc0pKcpAInpUPu+hUJjneVahRaoxhFEd6C4sRn6XuRyLrrdEU3lpXt6ai8fAp+f5+HfmvCeZ0BmnM0w9Slg9ZDFk/RRNCir4H9xvBFNUUxhNLnvpZDDEXnfc+hU7YNScGO3lfEcnXTldx/Xx2h13AXO2lNWvCc3abeoT7JfwIeZQyBDgQeV+IM/w6YWu9o3hTiJU8hyD/raf4pYkmb95EEibLwvxsuCJcW0I+tBT3g0Y2LX7XgMbtFhbY573Z2OfIRb/axhZCeB6vDuoaR6jaOVxBbd0fc9BMGFPYTHJ67lyKOI40M6Eo/rFT1EN1O0zkNi5asuDs9rv4+igvT9mRjR38FB9YXUijhHWbmd7JfXd1W7IOowcspRdMFLmmMm+VjsUsNK6jRuxsc7khBd0Z2PIemG/Ev0VlRPSSTGI9QbBPSxpdE122Igd1ueM55Hopxr4CYvQ5tC8AYM9iXfkv9wIQ1G/KXq9/1hfmpND5T12tRmmORTMvpSe/4rGBqvlyWICUeZ6geceVgRxhN1Jt
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(136003)(376002)(396003)(39850400004)(451199015)(186003)(38100700002)(26005)(6512007)(6506007)(53546011)(2616005)(5660300002)(2906002)(44832011)(8936002)(6486002)(966005)(478600001)(66476007)(41300700001)(316002)(66556008)(66946007)(8676002)(36756003)(31696002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?B2liaYEjsHTRTizIvMyF40Fg2qLEf+c5qmVrvVZ0k36YdcqQsczt83YP/sAX?=
 =?us-ascii?Q?CZxwzuHG2vemm/kOEDcFlUa9nj1l4huZxEJCEXnfm2AdBqe2WFWiFAZufKW5?=
 =?us-ascii?Q?Hi9ATnRHXxdHrNU6KnvsgrngftbQaA60lyDQ8gn9HYpVjYEEatfd3Pf2ql8d?=
 =?us-ascii?Q?sz/aw4Oy2vQLl+AytrqL7+3POtDMs5Q63sX8TIFst4rz9vFqOv+qqx9RUCpY?=
 =?us-ascii?Q?/+6p4vfUlMPUj67BDOT+ypntdc5xqi96oniELfFMy1VtVgwA6Lw48g/jtNlq?=
 =?us-ascii?Q?DCAHQsRacPihs+Vywp2i/epE/66JQ/8n1AN55QLcTexft6Vy51pRFggoDzdT?=
 =?us-ascii?Q?TUvv+tLfXqinAn5mOuu6UfwtHh/AUD7JGI6pazAGgQujAgrhLCsZzheEDPG5?=
 =?us-ascii?Q?5t9sUjozMKKZfu8ox0Fxawt/Td5JYucuUUqIEfxptRYmtHfzKLLz4BSdD//O?=
 =?us-ascii?Q?UxHaKKpwjDndeXt5jNwu4kFS3o0f/4YMKZT6hPKY2w8dJkstVs1SOnKio2m8?=
 =?us-ascii?Q?NdYR4LkKH4Arnxkhr2pRd8BDr55rrpyPqF6JY7B1w9KYYeMe/wWq/7DPedSB?=
 =?us-ascii?Q?pPZFUYsWTqnB2Dpmw8wK8DkeWSzxkugpS9GhNFZVlT+VgAv5OaHOjswe4Vv6?=
 =?us-ascii?Q?IraQWMMpU3xC3/ZpVZkqv1TeN5sxHKSNTJXt/imvLAfzjtZcB/l0rO0656ja?=
 =?us-ascii?Q?Mtu48eBQQqZMY9I7YKtXxzCfUj2AeKRvEAOXUu+kEZqUB2kxZstZahMhCyiy?=
 =?us-ascii?Q?Ewcop1HYxsc4V4rtIl4wk7l4PT9ImBB5Q8ENNeNGlVJu7l/h02wnrOwFtLFM?=
 =?us-ascii?Q?eQUqC7z2ThNJLZtMdSMFeP7kf27S/HCwHW8BSqMQCvCmWLnAv8ff80TjlhYz?=
 =?us-ascii?Q?2SYXeomBoCyc9a4dNcDW8+36fgjLE88n7VD/OEDNTqrRWhJx8c7WqSqVgUyZ?=
 =?us-ascii?Q?vMhCO9jdYCDRvxbwAMmwC+FmOzOh6nUnKJDscKpQxThscknxzY7q1n1kFrhC?=
 =?us-ascii?Q?Y9xV1Bs0JUBsA9fpbYv45IWxk/ttS/7HzeO8RzjyOJZx5nxxN0nvGKohodWf?=
 =?us-ascii?Q?WSZcn+s5QIg0R2RnKqQz7hhH2ULHO57Ev1mCC27in06A335tppN3MvYsvD9k?=
 =?us-ascii?Q?xp9ijGqoX0K16hX5vrDQemliw/UIcT1FJRAuuPuuVN9YKHf9yoi4e98AzHgV?=
 =?us-ascii?Q?OfJY5YlKs868T5HTWMj+epI4MhnsF7F/QYMB7xW4On7hL/uiRPFsnddZjBGr?=
 =?us-ascii?Q?v+8nFHrNr6l1QMuRTB7ap1d4txRZQjtuenL4GgqtEeediYttrd6hR2lu+Q7w?=
 =?us-ascii?Q?WtgxY7On8/A3Q6D02ejjZVzVTS963xUBVacr0mcv7ZLuJNqPOmTONYZd0LDK?=
 =?us-ascii?Q?ZyeJUTCoXHABF9jhiJi86hvwqO+dTCmgor09OAtItG36YpU2YIF3XfgQJI+a?=
 =?us-ascii?Q?Wzd3qDXB+YcwkDZEkKiwOZ5fJ/oCkmCADLirnEtv7+RIdcxbnk9IjFvR4vOo?=
 =?us-ascii?Q?E+f5fzmmWWXcNFkhFRSSmqyx4MvoZU5gei7+zYeUxbLJrxBdmV68UTtzp5rq?=
 =?us-ascii?Q?ZZAC5Rt7Qg+ga+rJod47zakKvCIzlO52yRNdNIVQ1D3CxkU1TYGl2/dOPJld?=
 =?us-ascii?Q?EkaRgRXbg9+tjS7oIHo6itc=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf10992-20f3-4fd6-a5ad-08dac0dc9f8c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 16:25:03.3166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YHdCS0UA+3muCxw6xlUJT0pwklbq49KNnk+722LMNyq0vsj2yJyqV9wNgxFNiA/i+U508V0IBWU4icT2LA/VB9hJvsncUA6V0hA6J9OAreei77VtwQIg5U92LWxnmaGM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9143
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 07 Nov 2022 16:25:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3464

Hi,

On 11/4/22 04:23, glscene2010@gmail.com wrote:
> On Wed, Apr 13, 2022 at 01:05 AM, Randy MacLeod wrote:
>=20
>>
>> pylint3
>=20
> I read doc ( https://urldefense.com/v3/__https://docs.yoctoproject.org/re=
f-manual/system-requirements.html*required-packages-for-the-build-host__;Iw=
!!OOPJP91ZZw!gmYKOZBh9UcNSF3JHQDjw_0nOFfONFwR7HEIg6foV2TsuEEWpC3v9hrGhhcXqH=
UxL3guSXC9T94_R-Y7Db4N5vKlvS-se3vUl5g$  ) it contains
> 1.1 Supported Linux Distributions=EF=83=81
> Currently, the Yocto Project is supported on the following distributions:
> ...
> Ubuntu 22.04 (LTS)
>=20
> And for Ubuntu/Debian doc contains
> sudo apt install gawk wget git diffstat unzip texinfo gcc build-essential=
 chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutil=
s iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev pylint=
3 xterm python3-subunit mesa-common-dev zstd liblz4-tool I use Ubuntu 22. I=
 get "E: Unable to locate package pylint3". As i know there is no package (=
 https://urldefense.com/v3/__https://packages.ubuntu.com/search?keywords=3D=
pylint3__;!!OOPJP91ZZw!gmYKOZBh9UcNSF3JHQDjw_0nOFfONFwR7HEIg6foV2TsuEEWpC3v=
9hrGhhcXqHUxL3guSXC9T94_R-Y7Db4N5vKlvS-s_QvVWKY$  ) pylint3 on Ubuntu 22. Y=
P needs fix doc. It is not normal that user get error on supported OS, isn'=
t it? I am sorry, I am new and I use github before. So I don't know how add=
 commit for YP doc.
>=20

Thanks for the report, I sent a patch to fix it:
https://lore.kernel.org/yocto-docs/20221107-upstream-pylint-removal-v1-0-01=
4ecbdb50c7@theobroma-systems.com/T/#u

See https://git.yoctoproject.org/yocto-docs/tree/README if you're=20
interested in contributing to the Documentation in the future, we'll be=20
looking forward to your patches :)

Cheers,
Quentin

