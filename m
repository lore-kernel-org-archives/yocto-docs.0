Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F5B9CF31AE
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 11:40:16 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4692.1763552412672448841
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 03:40:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=WkPNAvQS;
 spf=pass (domain: cherry.de, ip: 52.101.84.12, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EwWOCxh7lIGFO5XC9kY458ekvCDnwo01tSil9+PLZWXKmHEn0aDpZgOmc1RhINPMA+Bp4sRoWZ/exgLevf27W9rbV8RfuE6uEvJfwjgQ2ISQu8kR/y5phuzHQY1DDVbMhf9W0OnHXuNE6qxtq9SgFp+g4reQQjXzNI0EY1b5hwDsNR3oXqqJqhFoRa/qW3ZerDSH8lZool4wBdLmQlEU3iEUiRegLM71AJwrn+l+x11sda6O/zm2v5PI1Mnr07OsGee/FD+FyL4z5LUqVrIufevD96415e3Rl/6u0yhNJRDsixmOz/gNFq+2+vVYG2vHAuR+CADUk07K9AaO2itqhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+xrS+41mCh/XCUcTJxPTIDOS/m4yEoaUuwrlrQN5Lc=;
 b=X4SPG8GC3oOjnlkS7J/SiQJnrTh/PeyYzK4Fj6cemkQv/Uz7adjrH67aq2zVXQOqilPoZRrAfw80x1VTTRakZNirIZEAKprJJs8BuepMApv47N4+0phvVNNXrQB16GrUvNWfTKTF256slsaVtR+CuaM/NBQQvA5QMF891j2PQoDtj2qSwhQlNKd2+BF5mqpjKT+cQV5XGz/zZRS9Xn8Jmehw/cf66zr/PDU1wIpsluVbCyP0/QNLUaAfT780uY/gqHfc3ACWKI80Us2iYLJ0hMGwCj2ldGjSS696+KWTpmdxhcSCxVUSWfoptcMMiskbVeZ0mht15QIzXB3oYQZWmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+xrS+41mCh/XCUcTJxPTIDOS/m4yEoaUuwrlrQN5Lc=;
 b=WkPNAvQSkNnW54F7eO7E5x+Z56WSpoesfI6C2r4/PVosos/9Hd+j/rxKWG8+7dMEM72oXslw1QrsuteEiIOZVypNIVfNSFuOnmso6kezLk9kYvG660q7juyI7KvVCaQpzAsIx3yvdrEdPYZ1QNL7wlbc/x2rZFfEIY4GnnTkto8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB8PR04MB6810.eurprd04.prod.outlook.com (2603:10a6:10:111::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 11:40:08 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 11:40:08 +0000
Message-ID: <318bddb4-bd28-4be5-87bb-4262076bd495@cherry.de>
Date: Wed, 19 Nov 2025 12:40:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] can the assumption of building on ubuntu be relaxed to
 debian?
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <24bb11b9-85c3-9dc8-e655-b630dbbcbe9d@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <24bb11b9-85c3-9dc8-e655-b630dbbcbe9d@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BE1P281CA0383.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:80::25) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB8PR04MB6810:EE_
X-MS-Office365-Filtering-Correlation-Id: 353271d8-cf5a-4083-2542-08de276063b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cFR0a1g5aUJKY2JrTWhaWU53MkFYVUtXRlJ5WVd1QnhKSEhrZ2hYdm1RaVNP?=
 =?utf-8?B?TUsveUhZMElRZVZ0cTMvZ09sVWE4U2pzancvL0pxbDJmeEF1TVdrKzJETnYz?=
 =?utf-8?B?eUYra2dFSkJ6Mm9HSndUaDhRTlZQMXdPR3c3OWpPSzF3bkFGdmo5dUZDWlor?=
 =?utf-8?B?ZDJSMjRMMHgrcU11ZzJuR0JHblJJY3BmYWJpdm90YStraXpKZW9TVVdQZHR6?=
 =?utf-8?B?RnpwT0FXNmlkb3VqVjNEWXdISmI4dVB1ckJWeFFzRGZ3dkxqTE1UemNHTlEx?=
 =?utf-8?B?SldDWFlNb1JUYS9nTzlkcXBjalJIU3VMb08vTHRGSURRc1kyNEJrN0duQlpP?=
 =?utf-8?B?d3FhejlhQ1Z2VjFMK0t0eWtSZExhNENYZ0JqM0lSTFNOa09LekV6Q1JqQ05v?=
 =?utf-8?B?anl5azZsNGhpN1RkbjFEeTE4TjdZRU9RbWpmMG5DSXh5UkJNazN6NS9UWXZa?=
 =?utf-8?B?L1FJQy9DUUMyUjBhejl4dWk0RUVUNHRGSXNUc29aSWd5dGlKVzR0TFZlek5N?=
 =?utf-8?B?d1VXRW5PRVlTZmRHVEpGc2Z1MUJKcGJGSXdzTTFMSXB3V1dCMXVEMXVIRFMx?=
 =?utf-8?B?c0xqd3ZtNGtjbmY3aHJEOFVuZHNzWkxYN1RDYVRIRkJaSm14WEZRVmdraXZa?=
 =?utf-8?B?UDFEM2tOeHp2ZXVydVoyalJmakJVMExCOVlEQnEvZ001UzhBR01sODJTaXdu?=
 =?utf-8?B?ZXZ6Nm1pV3VkYVYrUCtjSmpab2VzdGdaUElXL2tWUW5DR3Q5L1gxSlVhMWxu?=
 =?utf-8?B?dnQxcEZ1dVF6Q1ZNNlVybUs4eExBSzZWZnNxSVNzYkRHWkFqU3FiMk0rK2Nu?=
 =?utf-8?B?MlFEdHdpUXlGaUN0bXZWSG9TTHM0eGZoUkZObDM5ZGVwcTJCdHZaVC8xYmls?=
 =?utf-8?B?WE9aTkU0NFllbE9SaFlWRjdTQWRLUi9jQmR0eHM2dk84RmpZalNYSnJGUVVu?=
 =?utf-8?B?YWtPUlQ0Z1lDMnpNL1ZiMEFCUFBjWE5udGdIVmtBZ1piNlJZV2lYclhsMmNP?=
 =?utf-8?B?bVdnUlA5cHVQY0h0NUNRQk0rOUtRNjk1L0lKSVNUWk1memQ0V2Jwelk4Sk85?=
 =?utf-8?B?dVpielhxS1Bsdm1SdEpjOE9vdmVnVUE2S3hIdlFVUTA2c09SakRaKzJ6aEhk?=
 =?utf-8?B?WmZmVVQzYjVSTHpOR29INHVCb3NsUlNVMTZKMGtieU5HQXRPTy9UcjVlZjhS?=
 =?utf-8?B?SlFRQjh2aURxbFVNWExSTVVIdTdLdEdPTjJGSUJLU1JsdDdVYkJDZk9xQnVk?=
 =?utf-8?B?cGZuamVmbkhxVTdJWXFUS05aa244anJMQWpWTm1TQ2pRVnh4YkxycVNHRFNH?=
 =?utf-8?B?azh2YUROWU5GRXRtd0d1OEszb3JpWC9oNTNyWGk0K2g5dVBTR3Q0OHRBdE12?=
 =?utf-8?B?Vk5GVjJ3S1U2dG5IQzFERWJNT2ZlU0tUWnptV3lZSXFYczFUQlpKTktKRDV2?=
 =?utf-8?B?VTNuMVp5UC9rQy83cnZpZFJCU0VvTFYzVTYvTTBBcnlJcURxVTMxZDFLbUlG?=
 =?utf-8?B?UUtub0sxalJEOFYzWFVtbDQ4ci9pRGI1aHFmeDlYdDRYTC96L2tCQ0Q4QkY3?=
 =?utf-8?B?b2NaVzVvSnY5dzMxbis5ZnZkTWx2L2dpL3BMeEEyZ091cU91SHBkcloxL0Rs?=
 =?utf-8?B?cTJ0T1d4SVRkWFhzN0hDRUJjOVYwNDZHSXVNaFFFeUdzYXlHeG9vTVlsVkRJ?=
 =?utf-8?B?alVEWXBmaUFja2gwZTJ5Qyt6Q1BGelZLUE1KeXhESEtZVVFUQjNzNGtXWVRK?=
 =?utf-8?B?d3FpclBIVkFGWGcxR0dwVkZWckFIUHM5MmNRUkVzc0JZV0VnZGNVS2p5QjlN?=
 =?utf-8?B?T1dBRkZzRkV5TTUzZU5WckhUSWtjcGRXTTVrWkpVQklnaGtDb01HWWlMQTc0?=
 =?utf-8?B?ZkZ4d0g5ZThDM0NacURFRHRDYkVSKzNsYU4rMjQvQkRwbWc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RklLNVZEM2N6UFVzNmlSWmc5UjJxZlQ0VFVFMjFiQ0dkYm16b0pyN244Mk8r?=
 =?utf-8?B?NVViUTFrQXlhSFpVb0E3MkdqWjZnd0pDWEFpa1p0RndpN3h5WUNScFM3WnJX?=
 =?utf-8?B?VXBEa1A1Q3FKcG5ydVJ4Zy8zSUUxSjRhc3lHSkl1WDQxdkNZSUI0bnBiTjFv?=
 =?utf-8?B?VU84dEtuRDcvemhwTkNibWVOZER4SGNvN0FvZGxQbDhGU0FiUmpHYzRuMFNv?=
 =?utf-8?B?ZTFYVU5QNkxKNGhCK2NTbE9PY1FMODdjWVUyR2dqMVg4K1RWWTJDWlc1SVZ2?=
 =?utf-8?B?ZHJHaFVSdXFoQVZxMEk2bDlSTkphZUl1S3pGRXAzWTZodTZHckNGdzNwREZD?=
 =?utf-8?B?LzVQT2FuRU1rTEhlNFJYems4WEQ0NXQwR1Rhd2hPQmF0T1lQRXhwbDBvZEdL?=
 =?utf-8?B?anpnSlFoUnlMTkk1c2Y3UWZXRkczblpML1RDRU8vWS9UbFpZTlNVNUp2SU5Z?=
 =?utf-8?B?U1NvMHRVWFcvMmpCOENRZDhCSzZOUlZRR2hDTFZ2WnBobkFOaS9VTTBwN1lY?=
 =?utf-8?B?b1FaekxNUFlmOEgrRUh3VjlwdjBqVWh2TS8zaUlmZktwMGVjTHBIU2FSbDcr?=
 =?utf-8?B?SXJkMHZsVFV4M2t0THRLc2xKL3M1VG9FZ3h4b0hSVWJETUhMZThqZld0STBK?=
 =?utf-8?B?eThoR3JZUVhwSGplcFpDcHRoNjNtNmhzanYzSmtwWG1VaUtaVVozREFWTVNX?=
 =?utf-8?B?Zi9MRTh4SXZuZ21NSzBKK3NTVjh2QU9xWDQ2ZUdJRzUyU0x3RzRMdDNFMlVJ?=
 =?utf-8?B?R3ZXT3JMMkhna1hDTmZBMy9oLytTNm9rSFBCemt4dGFZdnpRanlWdktVdldI?=
 =?utf-8?B?b2tlUUJoTDIxTG56RnRRdU5ucU5hVEVmNnpaSmUyNEs4enVpY1g4b2VyM0hZ?=
 =?utf-8?B?ZXZoN2VpNUhVR2pPRzM5RHBlVy9XWnpXeCtYRkFCNGUySUYrK1pkeVY0RVBI?=
 =?utf-8?B?SGpyOTA1bC9mMFViOFdZSXNjcnFSeExSUklCc2U1QjNQUlVhdjJNS3c3clJa?=
 =?utf-8?B?T1cyVDdBS2ZTOUE2R2xEbm8ybzRoVWMzSk83bWJqQldMSUR2dE8rV3MwRUpV?=
 =?utf-8?B?UC9FTnRDYUpiY1IxaTZSNUYwM0twN1AxS09xa2NocUplNFNiTVdScVUyeVJv?=
 =?utf-8?B?NkdUL0IwWi9PT3NxaTIyTnVYRTN1M0FFYVdScUtGUEJoTmlmMFFHZDd3UER2?=
 =?utf-8?B?L3d2TFBiK1NBdEZjOFlSbERtSjVEMjU4RFUrR0lLOFJDTUljUDlMMlIwQkdy?=
 =?utf-8?B?d3VpcWVzYkVreWs4RVJaYVhsWWVLdHR1bTlWQmlOdWlCcDAwMURNak1XTCtL?=
 =?utf-8?B?OEFCV2M5TlJiL1Q1NmZONVFFNzd4K1BvYk9XcXNod1ZSUnNjOUw1K0pTV25p?=
 =?utf-8?B?NThUamxnMWtTSVU0UXAzUU9CTWo1UUJ3aThrZHZDaE5Jd3RFTUFzQzRpNkN0?=
 =?utf-8?B?MHRhL2plbjZGRkNqZHg2YXA1eW1vRFpRcXJxNGtjUkFoWHNXd29OUjhZMlpv?=
 =?utf-8?B?SC9Oak5VRzB6dXpvbDk1dno5dVpqVzlMYi9jRjN1dkJrWjFhcUc0bDZta0Nj?=
 =?utf-8?B?bkQ4UytscFZKN2ZNdWZabUQ4UzN5RXBqNkZ2bWVZUUFGdU1QRVlla01kaEJG?=
 =?utf-8?B?dURSUlArbGwwNy9COW1VdU5pNk1PaFBBV0JaQnFEdml5QUlpdHVpTkZKTG4w?=
 =?utf-8?B?dUkyT3hQMDhRRWVHMUYxYnJwZTJQRWthNXUzeGF4WEp6SVp5ZUpSNVdPNkk0?=
 =?utf-8?B?aEhWeVpacHpSeHVYcDlONG5qaE1OZUNnZklzMDRBVXZQWllOMllUUmNvaUhl?=
 =?utf-8?B?Rm9GT1ZzR1R4V1VQOGhUQWVFWDYxTG9hcjUrK1ZCUlpTY3V5d3JPakc2dUFt?=
 =?utf-8?B?MEdpekNRbG82c053VTVZZ1RtaVpub3VEUlVmUTBwVHVSOEZrNHJrZEFWUU90?=
 =?utf-8?B?bURxS20wUG9zT1I0TlJyZHZybHZoa2gxSEtEVnY4b0kxRS9zMng1MlRBSkZN?=
 =?utf-8?B?dSszbS80WXRWdmQzY2hQM0t3dE1pSmQxT0tiOC9ubW1pM3U4dzU3VXRWd0Fy?=
 =?utf-8?B?bTUyU21Dczhmc2lDcFY5QlZpQkZkd2NDTTFHU3ZVbWw3TXRFZlZ4NGlycms4?=
 =?utf-8?B?VzBGOGM3S3lXUDZicThDeUkxYzQweHIvQjhpU0xjb0FPMExhVElvWDVybVBU?=
 =?utf-8?B?ZUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 353271d8-cf5a-4083-2542-08de276063b2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 11:40:07.9724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nlj4e8vfrGJNyDZaHQ+iDDOYSCyKTT0E++ZM49vzQG3VneemhnjvRDpR5zB2ObYNHUp9bhHRsXYS16F6aemp95xNHh0R+YGiEK7p6dtRSpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6810
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 19 Nov 2025 11:40:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8077

Hi Robert,

On 11/19/25 12:25 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    i ask this only because i recently moved off of ubuntu and onto
> generic debian 13 ("trixie").
> 
> here:
> 
>    https://docs.yoctoproject.org/dev/brief-yoctoprojectqs/
> 
> one reads in that initial note:
> 
> "The examples in this paper assume you are using a native Linux system
> running a recent Ubuntu Linux distribution."
> 

I think it can be relaxed to "a native Linux system running one of the 
officially supported Linux distribution listed under" pointing at 
https://docs.yoctoproject.org/dev/ref-manual/system-requirements.html#supported-linux-distributions 
which is what we test BB/YP/OE with through the autobuilder as far as I 
understood.

Cheers,
Quentin

