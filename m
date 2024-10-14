Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE879CFC53F
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 10:44:15 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.41])
 by mx.groups.io with SMTP id smtpd.web10.52075.1728902650282865242
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Oct 2024 03:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=aAbajF6M;
 spf=pass (domain: cherry.de, ip: 52.101.69.41, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B2i8ZAHgk8B+zkmK1fZrwE7UsHe5CR8ENzcbXADXWOPwb9Rr8YANpwVnW6jR4WhRZjTabbFOv0W7+rW80RZVzOoaalI72wLbDbyWkeGDet3U0/jZ4c8NV7f9Js0BC9byfBVBRn734vliKZawUB5UinDH9lJARklkrDntFSBoyHqo9l5WH9LmxxRP8zIpPjskDx9FLeN8D0Ic135tkpn3WMUsDFig2NG6evc3jTsLtSoc+0FlZRLoJyfrbYV92RW6nDMhWdYruQhTQgELRMrLNrm0gGNmkvExl/Q5MmxdLmfBj36WWdRoUlDaCLA5eW4o7h+K7/68RhWrjL/SeWa32A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Knv9fn5j7Oqph8VbO1q1uBzERc84oidjFJCNkZXuuA=;
 b=jPr8tBX2hasne9vuC/AuKwr9Puh6cptprhTW5svW4zPXC15sE5TX9nk6kPH+XB+LBe0FsJZoMb4G62Y3BMdZN6XR+R+Na8cwF9PLFHJofsw1ftJV4Tkp+K/lb8hYziyLS8CGzcPUdNUWBUNnrjoUrbBcQC1RaSAVhy4UKYLR8lvgK14QjZXPs4+Ucz3wtJtxdipEZcEWT0ejsj1FjG50TD5/wHDHByORtSRGLXW/OMripE+DaqQe9NdOHrrbeLVQCfFK4uLHK9jNHo5aLJT3AMKVs3lI4Z+CwG9xZ7y/s34RacVMtsqdScE+93IviSuxbKkAKSTj1pwanOFk+NjNLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Knv9fn5j7Oqph8VbO1q1uBzERc84oidjFJCNkZXuuA=;
 b=aAbajF6MHz2UJasPmOQcbqEH7hJOHljEsmtUW3Qgj+qg9Wqs8fcOheb/Z9g5o5Ng5Cyl8CYedGgpt6/Pe3beRXSK3rtZ0m2W8Pb+wzUqgjbIRqehncLXo5Yv3BLQwSMCXJjVvy7OdEpWg1ulWtu5glSyUsOmy15hNscuY7d810M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB9260.eurprd04.prod.outlook.com (2603:10a6:10:370::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 10:43:41 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 10:43:41 +0000
Message-ID: <6c969fd6-d6b9-41ce-9ed7-a5138414780c@cherry.de>
Date: Mon, 14 Oct 2024 12:43:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] Docs build/workers need inkscape?
To: richard.purdie@linuxfoundation.org, docs <docs@lists.yoctoproject.org>,
 Michael Halstead <mhalstead@linuxfoundation.org>,
 "antonin.godard" <antonin.godard@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <3019070797186fd40c2b71959ed6b995660a790f.camel@linuxfoundation.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <3019070797186fd40c2b71959ed6b995660a790f.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR3P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB9260:EE_
X-MS-Office365-Filtering-Correlation-Id: e1e5954d-1b7e-4d37-49ed-08dcec3d11cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UGpnN3I2NFhvNDFaM0lSRDVHdjFLaU5vcWREWExtY0RHWHdjNGpzUUJ1SGc2?=
 =?utf-8?B?bDZZaVJuU0JlbDVaK1NVZ0Ric0JTdjVNTGQ5SlpQemJ0MUIvK1FjRjJpTXFZ?=
 =?utf-8?B?ZW54d0FLZlBWcnpuTmE2dTZETEQyUm1SUDBwUXplUStaRG9ldkhYQkJyMXFQ?=
 =?utf-8?B?WUxXSHljQ29YaFlnR0hhc3VtcEtrQW1GeHFVeXh5dHBTbkVLclY2amw2S3ND?=
 =?utf-8?B?SkZZZnovbG1RN1dLbDBZcVNrZnd4YVFYU3FSMU5VWUJsKzVxV3ZZUFIwUjBH?=
 =?utf-8?B?Z3JTYS9QWnB3VzZvRC9mb0FZTDJIN01IRzRqOFBaQmVmM3VxWFdCcEd0WnhU?=
 =?utf-8?B?S3Y5NmUzbWdnd1Z5WERNaVhxdG9hMVcrMDY2ZUpiYm10bEtDTC9idVkyREpm?=
 =?utf-8?B?b1NSeWtMa0dpRTh6VjNTMWRvcWY4MmxFN2dBTGlVVkJ1WDdraFkxckM1Z2Fm?=
 =?utf-8?B?UHFJallVVEZJZ01sOU10WENoQ0VGMjFiT2o2bnR0U0NYRFMxc0YzaFk4Y2U5?=
 =?utf-8?B?dHBPNWxzZ0o5TVgxOTlkbUxIVXNkM3pOQ2tIelNHMUxmZklQSWx2TURaZ2FQ?=
 =?utf-8?B?YkFuMVp6UTYraHpiT2lDVFlCOFErbWtkcmh0ak4vYVJmSEtRTHQ5ZHJKaC9x?=
 =?utf-8?B?S2JaUmZHc2dxckZxMkR6V1BkcmZ0SXlmak1KamZzdXFlYkQ5bytUbVpIdGlX?=
 =?utf-8?B?V1NzNDJKTjdCSHlXRkh6Y2RvT0FDVzMzR3V1KzRpYVhEbENTZEZpdW5CcGpo?=
 =?utf-8?B?am8raHcvd09UZklPc0t6TkU2Rmxzb3d2N0VvZmY4RC9ZZnEwMzRUemxXb1Nn?=
 =?utf-8?B?OWNoMTYvZlF1T2o0YlNxMk5Nbi9BSEVyQkU4YVdTS0IzNW1oeXlGZjUyVnZN?=
 =?utf-8?B?YjdZdlFUZGpEYUhvY1R5VlpvVldQek0zaW5yWmdGMHQ5TkhLMFZETlI5MENS?=
 =?utf-8?B?SHZSMkN4UnU3b2c5YkI4MDJHWUVyVDg5aEVTVlVsdXByVFd0ZUZlM3FCblV1?=
 =?utf-8?B?TlJleWpnMjczYngyeHpLR25EU0J4OWo1OXV6eDdMSGpyVC9uOFlNNkJUTFRq?=
 =?utf-8?B?SnQ0SE02bHR5L1IxcjJtL1crckNUdGJzdGRDdXU2L1FrQWZ4dm5HMjlESVBl?=
 =?utf-8?B?elIwVTRlOXNCZGxaWVhxYTNNcytGbXBTQTBBZ09ZYnNZcEJGUC9CazJXVUM2?=
 =?utf-8?B?ajFOUHRjWWhBODdOa3FlRk14WFQxczhYOXZrTWcwbElPVlhhbnVGcC9lalo3?=
 =?utf-8?B?V2E2WnZyWHdxdkJJelBnRldZY0JiTmZHeXBvMXIrNXRQQURsUmlnaXlhYVVF?=
 =?utf-8?B?LzlzWDVPdlluTWpvSk8xcTRrcFh1dDBQaklUSFRWU1RaLzQ4eDdqU2JaN2xi?=
 =?utf-8?B?YmhRTE52VVo0cS90alBoN1R4TG1YckptZzF4QW5iVUhtUWwrbFBlR09aMk1M?=
 =?utf-8?B?VHJmUTlCNUYrNTdRQ1VLV1BaYVlPeE91eEdRSDNIcDZ0S090REZLUGx5QTdK?=
 =?utf-8?B?UHFXWnNWZzJuSzBLU1VPL2V1U2I5d2d6ckFQWGovN2NZTWg1eEJBUkZVZmxa?=
 =?utf-8?B?eGx4T3NteEhZaGRaTytQbWpIM3YwdTdRNFBsNXpic2duQUVnTnRVMDgwNXdh?=
 =?utf-8?Q?mH14zt4PMyAqddpqYqU/GfnQEN/wl2nSN/aXBCrREBtU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RUUxbmZ3OXpqWjE3bmdjQXJKZWk3OU1lemVvaS9rOU95TzhKZkdZUXlUT29G?=
 =?utf-8?B?WmZTcVNRNXJwUmlTNXoxL3NHMGNpcU5UcEhlLzhsVVJ0d3lHd2V6UFZuaWJi?=
 =?utf-8?B?Q2hOakN2Z3RtaGdUNS9VaGpsY3JwRXR4c2lpUzV4bU1Fb01YVmY3KzI0dUU1?=
 =?utf-8?B?eERZMks4Q1poc1lNMzMvU2hKcUM0OWdpVzhjOElQRytEY21BSk1aUENvZ1pq?=
 =?utf-8?B?Qk1zRmFzWnQxQzMrU1g3NlRjbmFrQzFwRU1ncHI1TWFDMWRiUHljRjhWcXdD?=
 =?utf-8?B?aElUNjhlK1E0eHpKVXVmVTE2M2xHM0s0b3MyMEphNWlkTTcvMlQvTzhTWm5x?=
 =?utf-8?B?eWNrQ0VDaTlvc3gyekhSb2dPeVJBN3Ewekl4czB4SVdyVStpYTkvQ1lxVTly?=
 =?utf-8?B?eDF6NEFScmppQmw3ckxlVW5DUG9OdDIxOEg3czFXU29QcUdOTW1QOTdOdUJr?=
 =?utf-8?B?LzFhRUlUYU10MVRGNjUyRFhMV1c1WTFEZHlqUVp3byt2UFVsUkJFWmRWbGMw?=
 =?utf-8?B?Q1RiMmllclY0Y21LbkxxdmFrdEp4c2gvQnJzUkxoUWtuMk50cHpscmRqWFNB?=
 =?utf-8?B?ZHc1aXNsMGNRVzVKaXRRYi9wMVVSQW5vbG5NTGNzdGR2d3UzbTUvNlN1V0dB?=
 =?utf-8?B?TjIvL3NjV0p4dzgyS29CTDl2Y2wwdnl2VXhGNVVmbjcvb1NwUk1JTy94TW9Q?=
 =?utf-8?B?YXFVODBOKzRoakc0Mit0YTk2ZlZQcXUrWUZvdWdKajRiRC9SRjJUeDQ4K09h?=
 =?utf-8?B?dGQxUkJ3Um5OdU9aR3gyMXBPRVpzaWdzenZPY01oMUd6NlFNUVA3b0lUY3Zk?=
 =?utf-8?B?ZGVXYnFBMTRESXc4UGRGMkI3MjFCSllFOGd6QjJUYm5PQk1Db0xZLzRPZHpP?=
 =?utf-8?B?UGFWMEFFaFd4MjJJZkQrMisyVnJmL0JyWnYvRENRczBwUmh5dVNJSXdQNW40?=
 =?utf-8?B?cUpIcVB0ZHkrZ05VdzdoZGZ0NWpNYjcvWFI3Sjh5ZGFxakdmNVc4eEQxRzE1?=
 =?utf-8?B?Q2RaT2lsWlRpZkM1NVBpb0RyVy9kdm42WHJiWm1tKzFva1hQMkF4WE1kTDB3?=
 =?utf-8?B?eG1YbEpzeFQwS1pTQm90bTFoZkJVVjk3UDBzeFdmbkxmWEY2OGpxTUxLOFRD?=
 =?utf-8?B?c3FmdDcyMzFrWWJkblhjelZ5R2E2azJxYjVVWkR4dEFidkk0M0Eram1BT25N?=
 =?utf-8?B?SEFCVzl6dmxVUlJteVU5RCs3cHczdFZsa1FFdmUxaGR5KzB0SThobmxJVHdR?=
 =?utf-8?B?YlhSdUQ3QzRvWllmNlZBQlRZL2tJdEU4R3Q0M0EzZGw4T3hVcjg0SEtyNmsv?=
 =?utf-8?B?V2RZTmxRS2RmVXEwejY5Q1lRTHNrQnNONnpPeXorWEt0UmNsaTIzQjdzMnJ6?=
 =?utf-8?B?aUp0U05mT0hTTWFna3VmS2ZQbFpTdzVQL0VIT016b3ZNSjdsMmswMDh0NDFE?=
 =?utf-8?B?Y3MzcTFtQjZTQmlKWlFJWitNeUJDb1o1NjliajREa1IyVTVtSktsRktGb0Vv?=
 =?utf-8?B?S2dhK05WcTltZEFOTUtxWVRjZSs2UVJrRm5CYm8vdVkvOFRxR0JCZ2hJWkNw?=
 =?utf-8?B?ZW40cmRSc2VPUEVxN1h0ditoazk5N3QrMEpDTXExYk9XYVlmcmp4Rm5xZkg3?=
 =?utf-8?B?blIrSGhhK0dVc1NhdGRFY0dGTEtYNDZrSzRBaHZvSXlRZ3ZzL2crUHNtbmJN?=
 =?utf-8?B?Vitid2g4dDhXcmQyNjlxSVRGYTBXdjhuR25sT0xyUG91ZTBpSVZDeTcxRFhP?=
 =?utf-8?B?L1JrSkFGb2xUeGVGMlpDbFR5dGxpZkF4aVhyY2M2VTl2TWVIeWFDMjg1MHJ3?=
 =?utf-8?B?SUV1blY5QW40d1lIeGhKNnNzQTlMSEFRV2t1NDBvVzgrMTE4bDhidUZubmhj?=
 =?utf-8?B?ZnZrU3NZbWNJaDk0M2g0R3BRYzZxaDlCOUFRVThkWExCUHVBMW9xc3YyWHlD?=
 =?utf-8?B?TGxQWVRaN0NmcENUZEl0VGdmT3B6NVQ3TFRQT1BKQ2l5S2NXdlJwRXZlbmJF?=
 =?utf-8?B?T3B6YzE1MktoUmdjK3JoT1cwcnlFa3ZSb0h6eTYvdW12dXlkenNWMStxM3Mx?=
 =?utf-8?B?VExzN1g5aEVRcm5YVGErSkRhZy9Ea1dPYTB5K0cyTUJOTXpuMUdpbDJSM2xG?=
 =?utf-8?Q?cjnbG7oYvkqCUHcjMiKHV1iEl?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e5954d-1b7e-4d37-49ed-08dcec3d11cc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 10:43:41.6493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /4p2oOXMCvvXXOj4jPLuHopbs/u5j/+lZ138NGY+eyb6dwGWtQOWlY8AeQmmd3oBSZQDB5JZhsE9OHhKxkCNkG9FUNdSszfiOJPOqS+tsvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9260
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Oct 2024 10:44:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5476

Hi Richard,

On 10/12/24 11:19 AM, Richard Purdie via lists.yoctoproject.org wrote:
> Hi All,
> 
> We've seeing docs build failures:
> 
> https://valkyrie.yoctoproject.org//#/builders/34/builds/6
> 
> The issue is that inkscape isn't installed on the workers and isn't in
> the docs buildtools tarball either.
> 
> I'm reluctant to start requiring installing inkscape on all autobuilder
> workers as we try and keep the packages installed minimal for the other
> builds.
> 
> I'm wondering if we should just pre-generate those png files alongside
> the svg sources? I can send a patch doing that...
> 

This will necessarily mean we'll forget to update one or the other :/ 
It's bound to happen.

librsvg is Rust-based IIRC, so that adds up A LOT of build time to 
generate the buildtools tarball.

For my company's user manual, we use rsvg-convert (which seems to be 
coming from librsvg :) ).

Cheers,
Quentin

