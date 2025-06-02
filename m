Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF210C54FB3
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 14:33:26 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.35])
 by mx.groups.io with SMTP id smtpd.web11.51376.1748874802009137977
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jun 2025 07:33:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=JpGrdIDi;
 spf=pass (domain: cherry.de, ip: 40.107.130.35, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DwJikda2tR+hWAN+YyWszT2hiL9rwZ5dad6qO4XhLWBbyHEaFFyzJnH4hO42Z8PldWjo4S9a32b51ld+3nkJ4wTavC2GrmPVu2bZw/h315hp52jjDzGdiwCl4UfM78pjZvYdDyyefy30gmW0HUBtLQdoBhF95fA4e08ahrTvZojp8XMG8WRMxe8py0DiVN6PIdBhIP8o7wuhISHsr0Px7xKijLmz/BizPtl/jzRervYrJGFyHyfMebp993gbP5aoIHtoKQClNtK160XmL3THOwZXwyWRDjEKuMbCEfvWdwWGrURLrOZQA7/iL9jg45o0sQ8HdZS1SJTocpQt7rMcSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJpAZBx98JU5yTsZwGNud+WzNUwkyM2ZiPbAKGhr/40=;
 b=MXSW4P19rULNFXBHzoBhvgyzrmsvq+Lb52vb5symVJxXKamOI5Ty/UL6TUYVUiJPxJ+ZK+XieGw23pUWaZHtnX+/lcuy7YnDJGaGjDYUFT7pvHowo6teR5DeH0kn/RlKznfmDSbl8dp0f6iwT57DghOfUWIFOwcVI5e1TS/8jT5K5dAK9MhR8OvvH092iOwFe7hMi0PM/EkkrQaKW4gVX3mv4qtixkzct5dEemaDDsk87uU/61mRi7XHX9Xsgveu4HU87Gr96QZq7gwx3rxtGIPUUQKH3es06MFwt7VEJ29qkop6vwU/CWkVaIiXpGJKIiwcobltKytmEIwg+xPhTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJpAZBx98JU5yTsZwGNud+WzNUwkyM2ZiPbAKGhr/40=;
 b=JpGrdIDiJ9wxFTIaow4Vngi3hcuwajlNCSYrNPERoHIVD3AkwxBP0/aOvQROxVTu8M3mRRbcOTpG7HI2I9+t+Eb9nfFfMxT/P7Bn2WAD4Dzo10rhxrSdG7EDduylykF0xv1FovLEzzlzAgYfJPaDk4UeJAXV0oGASCtcKuZGQnk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VE1PR04MB7421.eurprd04.prod.outlook.com (2603:10a6:800:1b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.36; Mon, 2 Jun
 2025 14:33:13 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 14:33:13 +0000
Message-ID: <263680fd-b970-41c4-a664-1c10ee93d053@cherry.de>
Date: Mon, 2 Jun 2025 16:33:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] can YP variables glossary refer to BB manual *and* add
 extra info?
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <1e850595-c5f5-8c90-4143-6a8ddbbddfc2@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <1e850595-c5f5-8c90-4143-6a8ddbbddfc2@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: OS6P279CA0137.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:3a::7) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VE1PR04MB7421:EE_
X-MS-Office365-Filtering-Correlation-Id: 86fa2703-86fa-46aa-a1bf-08dda1e267c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MlhUc0I2eThSVHpCeFZTbmJKbTRmc0ZJai9nM2pyOWlUOE5uVkxDakdtNHJB?=
 =?utf-8?B?MTRIV2dzalM1S0s5WWtwNklQTmJrRVR0aWVTSWY1aS9SVEF3NklrbEo2Q21Z?=
 =?utf-8?B?RUJDUXRlL3pXczh2THlkNmdIaC9vZVlIWm10cW1wWUdMS0tRUyttWDdaZkpL?=
 =?utf-8?B?enRkbGQrOG9sMmgzL1YvdzFPdVhCZDFTUDJDZGk3WlZPUnhOaGRIMlM0M25h?=
 =?utf-8?B?ajZSaksrUzFPdzg4cnFVeGF3d3U2Zi9GbFFYOVZ5S0lLVGJjVXF4dzM4SXVT?=
 =?utf-8?B?KzV1UHlqQllnSDhBaURJZU5kRXM2TmFWYlV4N0xKM1RPUHFxQUx2eitnZzBh?=
 =?utf-8?B?bTFHQkNUU3EwRTFTanNxS1RRZjdKL1VaL2FpTS9XZlc4M3M5aS9sb1NCL0pr?=
 =?utf-8?B?eGliNXZDNTNuQ0FDRVBLQU1qbzFMMFk4SzNESFVrQ25TNTRxeHpOTXFhVTlp?=
 =?utf-8?B?NjB3aHYyT242M0F0UEYyOSszUkJhb2dQb21aYTNyMlRyVFJoVVF1OXU3VTUr?=
 =?utf-8?B?VHM2NUVDSno0TmoxM1JsbVZBSWR5cmVQZkx1L1BTb1U2b00xRk5qVFBYSTk2?=
 =?utf-8?B?M1UwV1oxY3dUWDhOcHJhd2RUZkNvTzlLOGVMeC84eG13Z1VGU1NDbVpHRG1I?=
 =?utf-8?B?SG4wYnJsZmJSQndYRUNPTDhGL0tTa2V3Q2ppMU51bUw3aFZtUFpXb1VadjNX?=
 =?utf-8?B?bUo1Rm45dW5IdGZFZmkvYkJaSVBzNjZKckF0V2o2M3pGVXp1cVRxc0FqTDZP?=
 =?utf-8?B?TTkzWDJXM3pvVmlibmpYS3lwck9HSDljMXJ5QXV3Wlc3THpGaEpCek9ub3VT?=
 =?utf-8?B?SXhLUytWZDRJSWd0aVEyRDZUY2k0K3pOdnNIMEFuZGhpeDdpNUJUVllJWmhy?=
 =?utf-8?B?Z1FQWk9PNi9KbkEvZ25ZMEthT2JJOS9tbnFKMGhHZEJzZkQwdjYxelZnRVlW?=
 =?utf-8?B?alh5TzJuY3ArZUpZenVVVDFSV0ZERW4xaW40UHZSbnZ3UXh5ckhzQ1RPWnEw?=
 =?utf-8?B?S2pndlZCV2tMWUg3K0xyQlB3ZWZnZndlbzlGODRFellrRnZDclB5M3lDbWcy?=
 =?utf-8?B?QktzdDBxVG9TNXdoU1JWZk8wUTlCMmxWMGIrN1QxVW1XUE81dWh6bS9WRHMr?=
 =?utf-8?B?emhXeGp6L09aMEo5VEpSM1lvdGp6ekE4M0Qwci93dllNaVI3eS9VYlZEOW1I?=
 =?utf-8?B?a1JVUUwzcm4vaFpsYU42SDFWREQzdXZMOWxJblhrRVk1WUtwb0tUdWNrekJN?=
 =?utf-8?B?YnVPWExxYWN0OFZPbFZrOUQzZlVYa1dhSi9KSldhVFNyV01aQjlDZFZkSkc0?=
 =?utf-8?B?ODFBd1BLRnZ3NzRLSzZSQWQ2ekZpRk15Rm9McHFZR3NuUG9ZRCsyOTI2aHd6?=
 =?utf-8?B?aEFTcHArQndPWjZsMDFmWmpZT0I5YUsrV0o5U2o4VkQzMzhQODJpem8xaWY4?=
 =?utf-8?B?eUo0Ums4U05LczVLbVVxdThxejBxYmJsUGJvRWcxelQ1eFROVGYvOGkyUjM5?=
 =?utf-8?B?dkpWajdpYm4ydnVyeUIrVEJFYjlWQlRvSFo4NENOVHZzUTRTNnpuZER4QjZ6?=
 =?utf-8?B?VnVBeDlSV1ZhbTJPbDNSaGVuajYvSys5RnNvRThIV0xUOGNTcXgrM0ZpNzg2?=
 =?utf-8?B?U2ZzM2FMYUFMNnMvU2dtL0VLRDRwZUo3L3k5eCtUQ05DSk1ZVjd1Ukp2WlpU?=
 =?utf-8?B?Z2JaNmw5WHdaT05OVnJ4Mmt1L0tFNnNDWG1Pc0ZyS0N5Mk03YnpFd25GVmN6?=
 =?utf-8?B?aXEyRnZ3TE0wYkxqR1lDMTd0UFVweVBmelpiZzgyV0VWTEk3Q2lheDhndXJX?=
 =?utf-8?Q?UYFYLFF53JqpO/hk+9AiqVC4hEhA2bXxC6qPk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VG42dG1ITGR1Vi9JRXJBeXNueDZHc2VhT24rblVNbEdHbzZpem1vV1dIUUM1?=
 =?utf-8?B?N25Qai85UzZwSmRSWlMvd213SnhHZmdkWkVlZE9kblorYjFMVjlQUEtVSEQv?=
 =?utf-8?B?YTBBZG5DWlRYSzJVM2hIcDdQc05QeDNodWRqS0dwbWZ5THdLRlRtOFFNbElX?=
 =?utf-8?B?ZnYyL3lmcCtTTkl3bE1RSDIvT3BVQXlqQUczZlB1MWxlaERkRjc5OXdubWU2?=
 =?utf-8?B?eVpwNHhEdDlLWDR0RGR6T1JHclc5VWZSRzlGSVpvN2NMYmZ2Mm96UTdWamJj?=
 =?utf-8?B?a1ZQTE85RU1QVVpFOE1kd1dsRzJFK3k3VUJQVWlrQk1xYTJJRTlReXRXTWFC?=
 =?utf-8?B?aUlKK0xpcEZ6YWYxUXVIMjJna25jRXZkWXNkNXluNC9NeUVOUllGWENFMzdt?=
 =?utf-8?B?NlVjdlBYQUJYV0xMRHdHRXNIRUFlM05jQ0NKbndZV2xOSDBrM3NLN0xyTEIr?=
 =?utf-8?B?cE41a1Z5ZXVtVDRTc3V3V0NOTk5lUFdCQ2RzWDhlM0FHQzMwSEpqK05OK2sx?=
 =?utf-8?B?UmpPUWltZTkyS09HZTVBaU9LWmZ1dThQaG9jVjF1c3BuVlNleUdnVzlKS2ZU?=
 =?utf-8?B?VzU2NHJYNFUrdlJJTGRwbmdTbUZXOUV0TEJtS1VZbjJ0RmFxaldLMG8wOEcv?=
 =?utf-8?B?YWhiaVlwRFk4ZG9ySFMrSVpBOUczVTMySTFGSDZWK1d4UzVNb0dpdm9PbTlE?=
 =?utf-8?B?eW1jcDNKaFdMczRFcGxkYStLdytpTW04U0s3VnlEV3Z0dEpCcGdsQjlUT0dE?=
 =?utf-8?B?aWRiaWFGeXl1RmRyZXhGTjN6Rzl1dGZDT2Z4di9ieFgyWitvL1BkQnpiWElK?=
 =?utf-8?B?UHdWWjFiMWhOTWlOb1FrT2RxaWxhMGtncVJoNmxKRXZsZjJ4L05URXk4dkg3?=
 =?utf-8?B?RUVEbW1Lb3dreXJVWDZBRHFKVHRjWWJwVUUveXVsZHMzVVVXNDUrMWJpOEU3?=
 =?utf-8?B?cWFKWG1PWlZYeGpjUG8zd2w1RmR6dUZFck1ML05mWjV2MzhPUUc4R3h6SHpn?=
 =?utf-8?B?d09ScXdBWm84QUwrT2t1ZmxsSHNoRENtUnRhYmdJc3FmMFdVSCsxWC9mZzlu?=
 =?utf-8?B?a2dNNmhZSkV2STZLZlZld0h2bkhUNEIrOTRNM3dlTnlPMy9rK2d5Z2FWMlls?=
 =?utf-8?B?SXJVWmVCZE9RNThnTjV5dnQ0MlZNcFNRcVI5cDEzVWtwYmgxTUUwaXM4NjVi?=
 =?utf-8?B?WkNBdjFIVVVsUGFxN0VNTmZVWEg4c1FZampEMkFHV3ltWVZzclhWTHBRQ000?=
 =?utf-8?B?cnVEYUFDWGw4RVhKVzNIUXpVZlhvaitKUlUxSlJFQjRBZ2lPTGE0eDZva25R?=
 =?utf-8?B?azlpZE5uUTh6SWtJZUlJYWo0MTltNnZNTlRZNEc5MEl6ZHVoQUpoQXN4NTZB?=
 =?utf-8?B?akk4Wk5MaXNrdU1HZUM5c21Bckd4aW9keUc3L0lyTmNwY3RrVWV2NjlMVDJa?=
 =?utf-8?B?eFVIWWoreDJSeUc0cEJwVFBhKzJYb3pMY1kycmdPYVVPTkdUNkFvZUcvVFl2?=
 =?utf-8?B?L2RCeXpvSFgyYk90NEQyeEpkb2p5MTJZYktrTWpYM1lDeVg1d05xdzhRTVB2?=
 =?utf-8?B?eGtaQllOTC80NlRIcGpVVVJRV3pieXBtSEtjMkNWWEo4aDdZUXNCN1J6Uks5?=
 =?utf-8?B?V3hidnpIekRGR2VoMldCZzIwY0g3bHlMazJnR2FaSStST3RubVVvUis3aVRD?=
 =?utf-8?B?d1grMElETW9jc2QwRzZoRGRtWU9kSit6SXJpUkppZk5VOFVMbDQ0OUpKd05i?=
 =?utf-8?B?YVJmYm5KdHpNbGQ2UDN0aTVhRDVCK2ZKdmRUYlpMZ3Y2Z2FTTjFXVXJLajZN?=
 =?utf-8?B?dXMva2V3bmlmWU53R1VHSjU2LzNJbWh5aHErb2M4dTI5WmtWQjNKMFkvVUtG?=
 =?utf-8?B?NUh3Z2prZzEyZlJvbWNkT0xhcXRURVB3TW44bGFzR21VVlhoanZNQld2Z2xW?=
 =?utf-8?B?OFhaVFE4Y1F5c013YlZLdjNNR1JZb2hyL3ZmTHlzZXlya21UVi9xcWhtWkwx?=
 =?utf-8?B?MTB5a2d1T21JZnB0cVpqODlOSjYvRFQwQ2RkVmZHSG5UNG9GUlZjUDRiQnF1?=
 =?utf-8?B?N29vT2xYcWRzMDJ5TlhJQjJFWlNDWE9xd09weW5aRU5uSUlLSWI1TDVLTHRo?=
 =?utf-8?B?VVhtdkNUeUlhNFI0NXVUREludzFyZXg2QWZQQXlvTnQvN2VLSThJa2NiSDI3?=
 =?utf-8?B?aUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 86fa2703-86fa-46aa-a1bf-08dda1e267c7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:33:13.3578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BmzkV9OBMJEpUfFMd8TNwnPf2yi9zLqJZF3jpxkHcrIQD3L841EvKu/Z3NH65JiP6gXaCHr1g2RZS8PtCxi5L2qiNDYmCcUaBNiwFSs0V0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7421
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 14:33:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6981

Hi Robert,

On 6/2/25 4:28 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    (SIDE NOTE: if you're wondering why i am so newly active in wanting
> to help with the docs again, i was recently part of the layoffs
> bloodbath at Ford and therefore have some spare time on my hands while
> deciding what i want to do next. ideally something involving Yocto
> Project.)
> 

Sorry to hear that, wishing you good luck in your job search! But happy 
to see you contributing and asking questions again :)

>    pursuant to richard's advice this morning about how to properly
> document BB_NUMBER_THREADS in the BB manual, he correctly pointed out
> that nothing in the BB manual should refer externally to anything from
> OE-Core (or any other possible BitBake-based build system).
> 
>    to this end, i can see how the YP variables glossary:
> 
> https://docs.yoctoproject.org/ref-manual/variables.html#
> 
> for many variables simply links to the equivalent variable explanation
> in the BB manual. however, AFAICT, when that happens, the YP entry
> contributes *nothing* other than the link, suggesting that the
> explanation in the BB manual should be entirely sufficient.
> 
>    but wouldn't it make sense to allow the YP entry (or, for that
> matter, any other build system glossary entry) to both link to the BB
> manual entry *and* add some build system-specific content as well? for
> example, the YP glossary entry would first link to the BB entry to
> describe the fundamentals for that variable, and then the YP glossary
> entry could continue on to say something like:
> 
>    "The OE-Core layer defines a default value for BB_NUMBER_THREADS in
> bitbake.conf thusly:
> 
>    # Default to setting automatically based on cpu count
>    BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
> 
> So the reader gets both a proper build system-independent explanation
> for the variable, *after* which any build system can sneak in a little
> extra content specific to that particular build system.
> 

Yup, that's what I suggested in a different conversation :)

>    AFAICT, I don't see a single YP glossary entry that does that, and
> it seems that that would be a useful approach.
> 

I just want to avoid duplication and also forgetting to update BitBake's 
documentation.

>    Thoughts?

As an occasional reviewer: go for it :)

If you're worried into sinking time on this, maybe wait for Antonin's 
input first :)

Cheers,
Quentin

