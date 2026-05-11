Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA45CD3427
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 09:55:29 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.34])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46914.1778493319597716676
 for <docs@lists.yoctoproject.org>;
 Mon, 11 May 2026 02:55:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=huwctMfB;
 spf=pass (domain: cherry.de, ip: 52.101.84.34, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbjOoo1K61rpU96lxnDUlP5x748CLI6xtydHEeksYfM5pHIdFZwbzo+TtNuP0pawwI9o+2wYkfjS2Nu/aYvhnDKkpbgpPR4+CgVjYy206SSNKEQUfDCb4oZN6i7/naavGyeeo7EEx9QMnR3MKMHwo+9aDW0oeKkut5cKRYngKFBPIauu+gNSOJuAKj3QhTA0RN2nmy5T4KdPPD4kRP0rHfZLToRZZ62tpNzCWXXZcmiBPGTeCOhpocM7b3d50pFjhjS0SLc+bUDmW3dInEzfYNfTydmcUaVoJsZM+fFLDJO4V/Yi9PeYoehtkVQuee9bDw1Sp2RfGjwY+U/LRn63Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HnNDl+04NJ+quj1YbkzKzj3CIz3ZXvKmFZDo1YM1ztI=;
 b=XAbA/agOr0IDTfzF3V5uqTp6WMReehjaFpw+yEmL/nWxomjcm8vzg/z7U7Q4xSfi/8aOtpTDj4aITu3Hmh9g1ZN9655CihxQpFzYY91MWT0Gp1EB3pJ79w3x2hSJniJVJFpFdFTJHhw51WcvmjJi7/9jRfI/KRGOwver69rA8vTOdoEhrRCxjpxa+ClrnjErjUEc5T8WWXRreu0T1lqqtRwbVdGtGXhkqmz6N5Rt3iwR7f2d/o2O4HnaDlPpf9OPNFqJ2fvtBo/fiiNzwuPW3aW9ak7uamHHxNZ+C0S1STZlU2T4E+8boqJnRuizdtyuEAT+MnM44jcjKkSdxiC2yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HnNDl+04NJ+quj1YbkzKzj3CIz3ZXvKmFZDo1YM1ztI=;
 b=huwctMfB0TqNp9nm2D9hut3XtTng6iGsDyaqXjHBVMnSS3NXgCPcXv7k+9BVSeEedSVK67ioTBIRsJ+8yIPSudH1DEC2szPzFqtYwQbsL6wSLR8HuGuQOu6lQw5zkCAUyJ2w2dpToRvmlij06si+zhL03pQH/eBNF3fDtrTeuOc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AM7PR04MB6981.eurprd04.prod.outlook.com (2603:10a6:20b:103::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 09:55:14 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 09:55:14 +0000
Message-ID: <d3a49bad-4a51-4493-8ba5-18bf68c19cc3@cherry.de>
Date: Mon, 11 May 2026 11:55:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] Quick Build using word "naive" sounds a bit condescending
To: alex.kanavin@gmail.com, rpjday@crashcourse.ca
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
References: <e9ecc3f8-c93c-caf1-eb73-de73633cda10@crashcourse.ca>
 <CANNYZj8TrFArNqiE2uTowv5RvnourbGoweJ_ySDXmjFKsx=P2w@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CANNYZj8TrFArNqiE2uTowv5RvnourbGoweJ_ySDXmjFKsx=P2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0203.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::6) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AM7PR04MB6981:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e996579-ee59-4476-7f36-08deaf43663f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|4133799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	PE8nCN61PMLBGKflhDz8GD8E2CW1yiThWDQpJacIVvd7U0TMXaw53j98WEXbKdWW5lsy3Iq5calE4NJk0pOsACwPNwR5TDkkvPpPRZbUVG4xfLO/ZBIVJO45XYrhXBZ9nuVGSSAAG0KLtiumdPFr2ueINGzge/KbFXsUbbL9swqr5bUwutuWD6lZBgUJc/aCyvBJEBe+QkxSbL6caMfYrsOFOXFPI4Nhe+IoDqYjumbvYG0yAN2MSZYE066sgAtZCHkPxMuOSdPzCUdCPaD8KErgV8xObh3I7w73lp8v1BSM0aMR5f6iGBcspDd3dwpvfTUmOmon8IE1lTHHUbBsKIwfHnHX6AOl6N1VV3sz4c0RiUZHckf4v9V+qUhveRsEMvFGUm2MeiylZhK8APfJAmG95WxM1poGi5LVq5jhKJbAm0V2o7hTlckLVzAKhGpTn6jdN/9RHEeHmG5atKjorVbWMF4cyta1B05aRQrPMNBLotYgnRZ6OrOvXDHYLZHK0zZfwtyw9b2hsqm1/WdptPSEhs53nHuYH3H0IiiaDUtzf6ThkKEDaDhjDahUWD90oB+gGg3TPLZaITHCKOLXllwBCTasnipIxgP0KmTvs8aDudOyLBRuzAfhOn6utTgX7qe2Hf9n6QE5Rgvc0mio3g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4133799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TmUwMWhLV2o3aUJPUUxvYk5xQUpLdzZwZ0JJODNIRnV1aW8weUc5VlA4a0xK?=
 =?utf-8?B?QktpeXQ5VE1Hd2ZEQVcwZEdiN09reHp1d2JhOXc0VUllMmFPVFBveXVWYkRs?=
 =?utf-8?B?VFFRMkVpM0FUVXdXMFlxbXNvWHI1c2h2eGp3RDA4NmY5UW1XY1B2VmJncjA0?=
 =?utf-8?B?VlpyN0tWRVFPdFlEUXlNRWNlaWJuWEduU2kxdjR3NEVsV01ReGJzNjcrWHR0?=
 =?utf-8?B?YXRZdHkwNVh1b1dHdnNuVktxbGhCSWJMWnBmZkQ4cmVWeEVYQnAzNmNlNHVK?=
 =?utf-8?B?SmQ0eEdQOG54cXlpL1RBZWdTVzlFdC9vVHJhbUlZbVlPdm5FTE0yN0tTK1di?=
 =?utf-8?B?ZkVsZmFNa2JJS0ZPZjVHdk9maGRtR01VSm4zS05UZ21JRHJMcDNsTFRZNUZU?=
 =?utf-8?B?Q3hNWUZaSnNlWnEwQU1HUEgrTThzcUJIWnNnSlY4T05EV0Z3V2g2cFYvano5?=
 =?utf-8?B?RVFFZS94aEZnQ3F5L2tlNWI2YTdBSXBaVFBYYkIyOXBPYVY0YzJKa1FYclRK?=
 =?utf-8?B?ZXFtVTYwN3BnN1JwVE5zWnZBcjY2N083c2tYQUpDWmkrelVrcVpqOWE4ZjBB?=
 =?utf-8?B?b2hXUHdTU2V3a3d4ZmM1MmZsS3dPQ3o2SUZJUWVmWkpvaVFWM3YwKzJNS3ZC?=
 =?utf-8?B?MU1JSTRFbjVudDB5ZE4xcWlLQmoyREdCZFV3MG50RTdNaXl4VC9mQjhMK1NR?=
 =?utf-8?B?L1hrL0tNSUJVSFk4QXdNVGw1bnJITDFOa1NTeWZMWE16OUZweEVEbmZMWllP?=
 =?utf-8?B?VllxeTNQbEZyTUUxM0tKUlZBMXJESnA0SkhEUmJmeklqeG03Tm5GVnNDb2VL?=
 =?utf-8?B?aUNrdGxSN1p1MnNCTlp3TkV4MklqWGgrWXFXUU9QNDg1aDVSbWlxYjNIV0Nw?=
 =?utf-8?B?YmdzdEVxTEZ2M3BFZEdZNElFbUJnamh0eGh0cVBJM1hBb2g0MktIOHdoVGJy?=
 =?utf-8?B?MCtOaEI2REsvLzFKWVc3b2lWQ21ZQ1lLNDUzd2E2UVIwY01wRWI2WERxT2dS?=
 =?utf-8?B?WHFvbHFZOW5TMVRIK3A2VFk0Rmx2enNSbmlZMkY5RmhtR0dWSW1OVGtoUWpZ?=
 =?utf-8?B?ZUoxSkZZZTZVY1liRU4vTlFSSmFxWGdpK1Z3aGNZMkJKR2o2SWdlSVl2RFpx?=
 =?utf-8?B?NzdqUHNkTHl6RVlPVTB5ayswaGNUTEY4a1RMcG1QM2V5TDV2N0wveXUrWEkz?=
 =?utf-8?B?NkgvS2Z6N0NpNmtmRkFGNVpVNUtLYjkrL2pMWjVSSGFldmJzVVdSMFE0bnB4?=
 =?utf-8?B?Z1NWYXJON2JYSUhXQVpzcEhac3lWSUJ4QXQ2NzY5ZHV2bTgzb2ZQems0a1k4?=
 =?utf-8?B?SzU1KzI4N2NpWWNyOVFjZ3M2ZkxXNG5BSzh0OHlJUGVMbDlGMVZhWGk1cnU3?=
 =?utf-8?B?TWVQazZGamVVL0s2WTZuK0ViRnNaRVAxbXhJaVNxMC9qVGRkNnQwWW82YnVh?=
 =?utf-8?B?MnI5dk1ZVXI1N0h0NjQyaGhSSXFQd0RxRlc4ZTZrdmtsbXhCVDA5QUMrbUdB?=
 =?utf-8?B?NFVOSEFFNUZwUi9YVTlSeVNobVlsWlBvb1lWOWY0ZW5pZWR6V3U0NGNsa0FV?=
 =?utf-8?B?WS9GVXRvdlNnU2h4aU41RlJLYWx4STBkRXgzY1lnVjlYZkU4dFVYOGd5MWdv?=
 =?utf-8?B?VmVkKzVNWm5TQ1NKSVAwTXZkZ00vOXphbWVwcFRNSFBUUWdZRjVoRHV5YS9i?=
 =?utf-8?B?NjNhZmh4cXdUUXh2NzA0SjFjZmV6VFdlRll6b29ndnBBTTZ5cDJ1QUFKZEx6?=
 =?utf-8?B?ZGs5UGdJY2paU2JYMkV5NDNRR2pxZUFQRnFnbmEzaGpsazRnUEJscGNGYnZs?=
 =?utf-8?B?WW9qRUlHbzg3aDV0OGtoZUYwNVZRVWtEejJNbnBaNFpyWjk2U0pFb2hXL3pB?=
 =?utf-8?B?TjdvU0xTT2JrSWtId0diSm5uMmNSQUFJRUlaNGEyTmFOWldDR2UzMWVBOUdn?=
 =?utf-8?B?Uko5U0h0UmliSzFFWVRpZDIzUlVmM3Vnd2tMdXF3M2xZYThPRDM0QkNaZTMr?=
 =?utf-8?B?c21xN0Z0WVRFSnNNMUkxVHlSRHdwQ1cxM2tQSEJ4aEdMMGVsdldobDN6eDJh?=
 =?utf-8?B?eS9SQzhvMG5VNXZ5STRXbFo1bDFDS1lIbWRIbVU4SUcybHVCbkdqUmNKNm9u?=
 =?utf-8?B?WmVhVkpkSzFkbktyN29BVlQwMzVvZzFJMldHUEFyQldvQUtCR2IrVTkwc1Vm?=
 =?utf-8?B?bndqb0Jtb2kwaGt2VTJramlrelVqazY3RW1NL0UzOVhBdm1BcWlEeW1ieHZm?=
 =?utf-8?B?NXkybEwrb2dyL3VLaWNmQUdsL2F4bEpQQWVhZkFKVkl4VjdQdTJPVzl5YzVU?=
 =?utf-8?B?dmFadFZ3L3ZBanVOWkd1YXA0T01Ld3NKTlpSdXkwM3gxVG5HK0kvdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e996579-ee59-4476-7f36-08deaf43663f
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 09:55:14.7545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5lAbWsePBpInQY3zBgxl3iwgQ8rUs2wleHvDSAiREGHUpHyVx6tEqPNbFTNd3GcES7SgYxZ+YVvN0OugkzqbbXQzTScINRJm0uKv9+V8o8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6981
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 11 May 2026 09:55:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9441

Hi Alex, Robert,

On 5/8/26 8:47 PM, Alexander Kanavin via lists.yoctoproject.org wrote:
> On Fri, 8 May 2026 at 20:37, Robert P. J. Day via
> lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
> wrote:
>>
>>
>> https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html
>>
>> "If you are not in an interactive shell, dpkg-reconfigure will not
>> work as expected. To add the locale you will need to edit
>> /etc/locale.gen file to add/uncomment the en_US.UTF-8 locale. A naive
>>                                                                  ^^^^^
>> way to do this as root is:"
>>
>>    Can we not find a slightly less patronizing word? What is this
>> trying to say?
> 
> TBH, I would remove both notes, they just seem outdated and not helpful.
> 

Source?

This was added a year and a half ago, so I'm not sure we can say it's 
outdated without more info than gut feeling.

> This whole Debian-specific section is also duplicated in the reference
> manual, so the quickstart should simply defer to that:
> https://docs.yoctoproject.org/ref-manual/system-requirements.html#required-packages-for-the-build-host
> 

Yes, by design. See 411e8ebcf79d ("make sure Quick Build section and 
System Requirements are in sync").

@Robert, I suggest s/naive/simple/

Cheers,
Quentin

