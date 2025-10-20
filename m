Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 164DCCCD193
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 09:37:46 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.28])
 by mx.groups.io with SMTP id smtpd.web10.14111.1760953061499260133
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Oct 2025 02:37:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=cTYUB5YH;
 spf=pass (domain: cherry.de, ip: 52.101.72.28, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+oWa9HpSf7xZnImuAaOwxLfijOlF2nxtacFZcVRJDcfgmQ2FI5hI/bov2yRbX8hJhArODVg/w3JP8+yYS8WAX0+ne0QPF2wb6POByo/4o+x29Tmis2sojU7VxquaO7ZRUXkA63mT0B9Nzks6u4h/LG47iv2CJMDp/pOvuo+0+xVbCN569o35ZFmAOOc2bqya+Dsl/KgaG868aOncwgCJ7J5JyS/8Yk1wLTd0pd5KND1vDzQCIbWCnXl7h/nNDjT+j9VDQ2fszuceIIKYnj0rvF/Daoqz+m7bIjw6ozv5NX41XdQz55rQRu+58UhaKIx60ph2Mc1jLyP6vOb4MA9kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGV82pe+ImyYvU7TYKOpDtzkx9Q7NCdrV2QQ20vq+f4=;
 b=rJZuZcTZAJWxQRWz/hwlgk38jc2c3ZvQDcZZl5IE2pwrreuvnEUmIiwnths5gmJOxVsuHGA/2H7yYwGUHFH37+0KhFS4B+f5fGXZNjXRiSMgbFDIaGFc9PxwtEllw/oUNM/yhbPMH23qNZ6aQn1M5GzV/vajVcdQK4eB56WxNB8CQMqsTMGD0xLUHGV4VWAH11eJdXVfoeX9is3d1Mcy/EMrA2CI4EVaHOApuWtif3N/IgkGJGEWo5of/HZDyC/BSK64XKfg80z21tM2ZptFY/9reSPGz458eXaCY7v34VDoSItSBqxiQJF2fcwsujaBbL8/onGjABJc+XmdlEv6RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGV82pe+ImyYvU7TYKOpDtzkx9Q7NCdrV2QQ20vq+f4=;
 b=cTYUB5YHcaJvi7RyKdvuFCO7Sg+M1r/ETaLs9hKUF2bJVTZ2wKnaxzZ1F9JNFPgxBwxJ8I7o/fDamL/io5wALdeYrIg/HGktuK0cUro0IBo7g7kE8YFe7uigWwRH6/rSWIYX2gqYle5t1U3GJXNwlfhJ385RPZbL/O2P8MrJ+Ks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU4PR04MB11771.eurprd04.prod.outlook.com (2603:10a6:10:624::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 09:37:37 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 09:37:37 +0000
Message-ID: <6074aa4a-4054-4260-bb80-6d06e3867a55@cherry.de>
Date: Mon, 20 Oct 2025 11:37:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 17/17] migration-guides/release-notes-5.3: updates
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
 <20251016-release-note-5-3-second-hunk-v1-17-20f21db1f93c@bootlin.com>
 <368a4429-8ba5-4c93-b855-18c80d323a73@cherry.de>
 <DDN0T6RTSU01.2DU8AYQ5F6ZRW@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DDN0T6RTSU01.2DU8AYQ5F6ZRW@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR2P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::8) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU4PR04MB11771:EE_
X-MS-Office365-Filtering-Correlation-Id: ed77b707-00b1-4ec7-f9d0-08de0fbc4dcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NWw4dXlQNjhQT1l1eForT0R0U2Y4TEFLV3RHWnpLUVlWcm1VL3A4cmxWYkxN?=
 =?utf-8?B?UFBZbkVMcXVjc3d1cmlCVk40dWo0WkJqU2t0SUx3V2JwdlJTWEVwSXV1KzBu?=
 =?utf-8?B?c2pZc2hrbklJSXdDWmV5Z2M3Q1B2MTJ6SG5HY0tnVHJZVHd6QXZkZGZxUlFx?=
 =?utf-8?B?dHJ2d2QyUmRlL2xCQzhCT1Y2dVZLdHB5MUJ3YW5OWnMyc3ZkdEJVVzlQbC9R?=
 =?utf-8?B?SHpMZmhZSmxTR2RVdHFZQnJzTEhJSzdhN0hNWk1Gd2VZb3BuOWY3aHlTQThh?=
 =?utf-8?B?bDMzTFl1aDVycGJhSWVtSElkemtQODY3eUJ5WmRvd0pMcHdKTU5kY1JWd3Fu?=
 =?utf-8?B?TmtxWTYrMW94YnVXUnhJT1RRSXAyR3VwcDM0QUJWdGc4TkxpK0g0TlFHaDVP?=
 =?utf-8?B?VVVvVzd6a1Z2anBvY1NlSzFyQjl1Wk5IM1UxdVNVOTdwVFdQMzdmMCtIQUY4?=
 =?utf-8?B?S3JjU1U2SThwUHlFLzI3Yk9FT3pUeHdqaWJZczhvYWUrM2NiYjBTOVBjbXdh?=
 =?utf-8?B?bEdjOFBmZjFlQUkyMThycnBNSDVCWDJxUnhHendpVVBTa2xMOFU1ZTU1eWVZ?=
 =?utf-8?B?U09ScVpYdndEMnFUdExTbEJrZ0QyVWtacW1sMXNvOUppdm1YNWpSQ2hGRXJw?=
 =?utf-8?B?cU5XVnZacE9vbHh2cnU5NGdDQWVYTmZETGVSZTZJWWxwb3NlRkZBZGdZYUgv?=
 =?utf-8?B?YkpYbktZNU4zRWdmK0Yrc3hhMko1QnJqMjQvQ2FyRURRN2lxWVE5R0h5WHFU?=
 =?utf-8?B?OUtPOWt2aXVxRjBjSXhQZnlBbjJKZUt1MUFweTZmbm92aXp5TGxZTENLRWZE?=
 =?utf-8?B?dHZTMGVGano0anBLdC9tWFl5NjRKcUN3QldIRzlvR0dhOEVheTMveDdDbG5j?=
 =?utf-8?B?endtdjluZ21VT2FmWkllMTJqWjNBakFGWWpHQ3RhS2hTbm1NcEFjMkZCWmNo?=
 =?utf-8?B?RjBhMXRBRnNQQ054bDRSUlZvN1hXbVBXeXhvTXdwTGxsQkYzUzNYbXNNQVZ6?=
 =?utf-8?B?SnZMV21jUTNLcitkd3hlT20wMGxrcE9hS0pnclJ4NVV4UktZckZmT1JPZWlz?=
 =?utf-8?B?Wm56SUNGOWxta01va2ZjYmk0cWl2RlVzZFQwV3dwWlF5M2hrcVpuTDR2SHVM?=
 =?utf-8?B?dm9TSUlFUEI2V3NGa1ZYeFhRVlNPVFRNWUp4bkk5T0E2djdLTy9PbW9ZUS9U?=
 =?utf-8?B?aTRuemV4Mlc0eTFPTHF5MmFJWFhhQ1R3RlBRb2dEaUUvVzFiYUFzMHRKN28w?=
 =?utf-8?B?QzRLb3JFaWF0QWtCQWVtTG5vbFRaZktCY0Z0T0tXMWRuZ0NmNG85Yk56ZEVF?=
 =?utf-8?B?U1AySTBRM3kzdTIxQ2FLOHFUcW4xMmJzYUJZWUVieFhnZjB5NDNVRjlCVUZD?=
 =?utf-8?B?ZDlZRW9XQWJFNis5WmhIbmt2eXFNK0RjazEvWEdQQWpsWWRuMnJVTk9kUlZq?=
 =?utf-8?B?RkNsUzUvcTYrQmVsNHRGTFVxeVZPdTlOd3c5eVhoU0dPbS9WRnVmM1RvUEE0?=
 =?utf-8?B?YjNYaVpIajBpVGFtTHFnZDV3UTBya0lVS0RWRHp2eVg3YzBYRXlmSGtWbmhB?=
 =?utf-8?B?b2JiSjFiRkZIQmNjVUNSK1RTaGtDck85Ti9SUkM2M0lhenJ6bmtVS0QyWFRP?=
 =?utf-8?B?a0hhRWxDcTBlREN0RWNhL0MvTE40cnJwOHQ5Y1YyUjhqUTViMWxDTjlLalVk?=
 =?utf-8?B?VXA3N1dUYnJoUFVuRXpBdUJoVWg2NzJxU1VMczc4TXFua2hqbVpRcGFYWXpV?=
 =?utf-8?B?dXc2YkIyclJqei91YXJvTWVXSEpMT1czMUZMSkZJcjlBZDRIZ0J1ZUpVbk42?=
 =?utf-8?B?NlJ6c0c1dkhmNUlxSCtQNFpsN2hSejh3Z1RQSzdDOTh5TEpyODdobGhLRmJX?=
 =?utf-8?B?YmR1Zk9JVzJZdXJyMG42UlBBRjlISnhxYXpGdEdtQ1RMdWc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YlZEWG9SVkRENTVuUEdFV1lDSitoOE1KcGtpT1Jab2g3Yjg2Z28zZWRHUEdy?=
 =?utf-8?B?YXZYeE1GandiWnFVTUgzSCtLTGZueG5MSHI0OVUvdGdDV1FYUUJUL3pCajBO?=
 =?utf-8?B?M2RVL2J5aTFlZ3ZYM0xaUzFEY0RhRHIvWVM0MXNKbUg0cnJIU1hSZzNVYTdP?=
 =?utf-8?B?SUtYMlpadE16dHNTQWdqanFPUGUvRW5VakM1RmJ2Q2lVRFZBZnNIQVhmVkx3?=
 =?utf-8?B?L002SGxiVkU5UjNYSm91MkQ2QzFlR3d5ejNUYk9nVjhkdUxzaUFya3Q0cExC?=
 =?utf-8?B?TkNvSVViOTNvaEdraXphR0VSZkNFVmhqcExrTk1laDlkb1hBVndJcE1vbTJC?=
 =?utf-8?B?Qnp0ditMREk3REpiVy9mUG5VTU44WjB2dnhaRy9GVGdXa3NXVnNhUlJBd01Q?=
 =?utf-8?B?cXVNazRZVHkvbU5RMmxwUEtWaGt2UkhBcFA5bmVnd0NCU0pkRVlSeUNoYnRy?=
 =?utf-8?B?cktORFNzNUo2anl1TkJ1blFSeW5vQ083eGk4YjVMZTRjYnJiVUFZeERhVG9D?=
 =?utf-8?B?YS8vb3NsWmZZdnJNUklqVEtUUzFOeWQ1STRiRUFOUmJiMjU3eWJidDJ2Y3Qy?=
 =?utf-8?B?Sk1Cb1J4dHBsWG1MRjlmNmZxYkxaL0xMOXMyWm8zUXk5K3hxSEJNbENHSzVG?=
 =?utf-8?B?T1k3WS9uK01aZ2lJNDg5aURYM0c5aWZoZmJEQzgxYmo1VFU5L1MrbkY0Q05W?=
 =?utf-8?B?RXlLTmRYNTFjamFXdEs5VHBuTzU3L25YRHlwb3ZyRERLQW1xcGtBYUE5V0hP?=
 =?utf-8?B?a2VkU1ZkK1hMblFHOFRBTnhFRE1OaGRGMnZQWmZUUXlyaDR6UkIwRjE2V1dq?=
 =?utf-8?B?M1VqZ1dRTjB1dnFab1ZTbS9QV1VPSTBxamQ2NHBwWG9RUGEyRnY0VVc2RTUv?=
 =?utf-8?B?WWpFd0g1NXhyUTJCZjRvdkh5MzFBcy9vODBiZStIb2pmMG5qTU9GS21ZeHNN?=
 =?utf-8?B?a1BGWVVnRGpscTUwdEh6ZEpkVGE5UVZ4NWFuQ3djQnpzeXJabnlIZS8xR2kx?=
 =?utf-8?B?YWJubjhIMWRNNVB3SDBWcUJnWmlxWkFlS3NEMWRDTXFtZnlLdGJGNFhWeUQ4?=
 =?utf-8?B?QkhFOUFwMU10bi9nakFpWFMvU2JHZ3cwNkZLRld6aTlIQWc4citoSU1IaWI2?=
 =?utf-8?B?TlRvaGV4L3dacVlVSG85ZVlaYmxiNHYxc1ErbFhqY3RDSjh5TmJQNVcrcGY4?=
 =?utf-8?B?RG40MVpPYTJaQ1o4U2h5QVBzZGI1cGxMOWhYZDlnclh1Y0dsR01zUHViRnRN?=
 =?utf-8?B?UnVIWXF1REVGZ3pYVzFRbFBLNExWbWtZMWRRQkZlVUlUemc2TnhUeUI2emlw?=
 =?utf-8?B?YWR0a0NOYUpaNkpMMkYwM0c2eUZXbUxSbzJnYnVIbkdHeDBka2JSclR0b3VP?=
 =?utf-8?B?Q25FR0U2ejhEN2hwMS9lbDMvSUVnUmI4c01jTHM4YXlsNmV6NXM1ZENGVmZh?=
 =?utf-8?B?Tm56WkRvRmZxZU9SUWpJNTJKVFJuU2dERU1ONVZOZDNXUWcwbmdQSzNucXVW?=
 =?utf-8?B?b2VPYXlhV0JrSS9RL21mbmxMNnd3cjVOVTAvTzlHSGVMQ0FjK2d0TmN6VWY1?=
 =?utf-8?B?blkrTzV1dW1rV0dPR0hubDJ2NGZySDlmdnkxcVEzNUJsTklidVZGbEgzSjhs?=
 =?utf-8?B?RFVOMXpRVExCbHNxVi9JTnd5WUR4RXJhNEl2OGZlRHRvVGJnbWVVR09pVHBq?=
 =?utf-8?B?L0Q3ZU94eWxLU24ycDRqWFZCSWhuZzhzUjhQcXVmcTYyaTRpUVVmQXd0UG5O?=
 =?utf-8?B?TmRFdG0xUVRXbXp6c3lwMnk3YzNhaEZuMDYxRExuWEFRaFlDVWNDdHRSL3Jj?=
 =?utf-8?B?M091TU85Z0dlbDRveGFkalM1YXJOeW41TXZ6dC9ORHFkTURDV09iYzFHalc1?=
 =?utf-8?B?M1hoZG5VcG1rMzhOMHljQ2F1Zk51U2VpbkNBZFBmWEFMUnQ2WGM4VVp4RVMw?=
 =?utf-8?B?cm1xYkpobVJqMS9vOGF4bzZkS3VZbDJEL3Q4Y1hPUWdSN2dIZ3hGUEVlQXhh?=
 =?utf-8?B?aklJWk1KY1Mrb0VFbmVVQ0RpK21RNmU4djAvSW5CbUJaSkI0VVZkV3lrdk9C?=
 =?utf-8?B?dTJFeEtncWptQnJXRTFwSHl4eFNRbUVDMHMyWTRDdGpkejdxUktybHlCSWdx?=
 =?utf-8?B?SXdUTmFzaFlSZEhTYjdUUC8xUUN2S1VPd3orZlkvSHFJRFJlQVBsZUhPRHJn?=
 =?utf-8?B?N0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ed77b707-00b1-4ec7-f9d0-08de0fbc4dcf
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 09:37:36.9616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5zRxMvRlzeGJCiX70f/37PC3O2B2tBYTXvB/hljMnK7NAVlfbcGfMa/jbMIsRBU7vJHxtMalHnkQspNbFGNDCgA09b4Kfb6iMKVZMk6S7qw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11771
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Oct 2025 09:37:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7758

Hi Antonin,

On 10/20/25 10:52 AM, Antonin Godard wrote:
> On Thu Oct 16, 2025 at 1:02 PM CEST, Quentin Schulz via lists.yoctoproject.org wrote:
>> Hi Antonin,
>>
>> Didn't go through the whole patch, but...
>>
>> On 10/16/25 10:54 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> [...]
>>> @@ -147,7 +156,9 @@ Supported distributions
>>>    Compared to the previous releases, running BitBake is supported on new
>>>    GNU/Linux distributions:
>>>    
>>> --  XXX
>>> +-  Debian 13 (Trixie)
>>> +-  Fedora 42
>>> +-  Ubuntu 25.04
>>>    
>>>    On the other hand, some earlier distributions are no longer supported:
>>>    
>>
>> Weren't we supposed to remove support for Bullseye?
> 
> Yes, but is is still part of poky.conf [1] and running on the Autobuilder, I
> don't really know when that'll change but I'll keep an eye on it (I've been
> holding on your docs patch for that reason :)).
> 
> [1]: https://git.yoctoproject.org/meta-yocto/tree/meta-poky/conf/distro/poky.conf?id=fe65e142d0d9ba0e51ff9175ffa82e902f982a20#n33
> 
>> [...]
>>>    
>>> @@ -206,6 +226,8 @@ Removed :term:`PACKAGECONFIG` entries
>>>    
>>>    -  ``mesa``: ``kmsro``, ``osmesa``, ``xa``
>>>    
>>> +-  ``systemd``: ``dbus``
>>> +
>>>    Removed classes
>>>    ~~~~~~~~~~~~~~~
>>>    
>>> @@ -269,4 +291,22 @@ Miscellaneous changes
>>>    -  ``xserver-xorg``: remove sub-package ``${PN}-xwayland``, as ``xwayland`` is
>>>       now its own recipe.
>>>    
>>> --  The Wic-specific option ``--extra-space`` has been renamed to ``--extra-filesystem-space``.
>>> \ No newline at end of file
>>> +-  ``gdk-pixbuf``: drop the ``GDK_PIXBUF_LOADERS`` variable, which was part of
>>> +   the recipe's :term:`PACKAGECONFIG`. Instead the :term:`PACKAGECONFIG` can be
>>> +   modified directly to achieve the same result.
>>> +
>>> +-  Remove the ``meta/conf/distro/include/distro_alias.inc`` include file,
>>> +   which associated a recipe name to one or more Distribution package name.
>>> +   This file is not used and maintained anymore.
>>> +
>>> +-  Remove the ``nghttp2-proxy`` package from the ``nghttp2`` recipe as the
>>> +   ``nghttp2-proxy`` package became empty after an upgrade that makes it a
>>> +   library recipe only (due to
>>> +   :term:`EXTRA_OEMAKE` containing ``-DENABLE_APP=OFF`` by default in the
>>> +   recipe).
>>> +
>>> +-  Remove the ``util-linux-fcntl-lock`` package (in the ``util-linux`` recipe) as
>>> +   util-linux now supports the ``--fcntl`` flag for the ``flock`` command.
>>> +
>>> +   Recipes currently using the ``fcntl-lock`` command should replace these by
>>> +   ``flock --fcntl``.
>>
>> Would suggest starting the list items with "Removed".
>>
>>> diff --git a/documentation/migration-guides/release-notes-5.3.rst b/documentation/migration-guides/release-notes-5.3.rst
>>> index 417087e35..57f50f4e1 100644
>>> --- a/documentation/migration-guides/release-notes-5.3.rst
>>> +++ b/documentation/migration-guides/release-notes-5.3.rst
>>> @@ -11,10 +11,21 @@ Release notes for |yocto-ver| (|yocto-codename|)
>>>    New Features / Enhancements in |yocto-ver|
>>>    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>    
>>> --  Linux kernel XXX, gcc 15, glibc XXX, LLVM XXX, and over XXX other
>>> +-  Linux kernel 6.16, gcc 15, glibc 2.42, LLVM 21.1.1, and over 300 other
>>>       recipe upgrades.
>>>    
>>> --  Minimum Python version required on the host: XXX.
>>> +-  Minimum Python version required on the host: 3.9.
>>> +
>>> +-  Host requirements changes:
>>> +
>>> +   -  The minimum disk space requirement is now 140Gbytes (previously 90Gbytes).
>>> +
>>> +   -  The minimum RAM requirement is now 32Gbytes (previously 8Gbytes).
>>> +
>>
>> It's time I stop building on my laptop then :)
> 
> Haha, maybe I should add "suggested" minimum RAM requirement.
> 

I guess it's fine, it's just that users running Yocto on systems with 
less than that in RAM should now be aware that they are entering 
unsupported territories. I guess setting up the various BB_PRESSURE_* 
variables may help still building on systems with less RAM without 
constantly triggering the OOM killer. Possibly this isn't an issue with 
building baremetal or somehow figuring out a way to build an image 
without needing clang/llvm/rust (getting harder and harder :) ).

Cheers,
Quentin

