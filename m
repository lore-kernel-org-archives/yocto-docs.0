Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70062C87FC5
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 16:48:39 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.52])
 by mx.groups.io with SMTP id smtpd.web10.1438.1753375709647991158
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Jul 2025 09:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=lvnS1jdz;
 spf=pass (domain: cherry.de, ip: 52.101.65.52, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fBe/fTmD6u+icilcisDi4R+xHozHHQgGYm1dI9iLODGYte7kFJdo4Gh7RVjtlfhbEFZ+BvXmZz1/banUEUuagKprWFKwYBhgjFywMalO+yEN0qciDEKnXFeMlhTS2ZD+lF/IxTO4tMMSYX2GnEnf2mT/N2IqMibnaQc06ylREgMMIcafisaKQReWvrfuYWygDo6/rhDVnDRhQQhvAs8cIq3iOTcPkC9oviQ17kwNa86EtrSXZkkrfac1jtDxn1jmqSXv5Cn+szzuCZJ/l4rl4s3wnbmc3FYriHin4gHrz98KXQy6h8BC5CH2p2lS+7uGGpgmo9WaL+EvCPXUEbnKJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEj3Zr4euePbxT1PClhsRyrRxT4CT1BI2y/IZvOAnMM=;
 b=DpWX5RtlID7aTp8w/VnxZzifl9ZhSn5x7kwNm+yMSDjzZnNRXjdrf38hEAPhqedoKUVydF2xd+2Y0OkUhRH+36nP69XDZJOkG/JE6+gcDJqYqQRToWwoBfk7Mj2FNE6UP9cb6NR65paaDAvw9KUfU2YS5nboNZtNkt56Edooyc6Rg+tnBwrnzMDMiCn+jPtno8ZaDwlux8dLFhaB7a/7g4nbXLEdyzM0m+En4o6ykTFz+kjpO6uZe0Dqf0yF4FjumcWT0njZSB5pWbC54/NOa4QnYU/cGDb4kN90GB32ycGLkOWr/z/uP5A2gxj0foeRTZp/E2DK1Zgpq1jUyXJu/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEj3Zr4euePbxT1PClhsRyrRxT4CT1BI2y/IZvOAnMM=;
 b=lvnS1jdzmYFqBLj7Caz+s4Oouh5sY97YWGOmue8RULYqyuI0Hna9VCtFau/oNLF4IfHtw73LgHduURksIp6VEg0fT3OxZihXacLiJC4DDOp0POHGPck8pcUipIqzQmn3qbD/7L5s9aENhV4m/w5sVq+23fGgYgyYU269fWfb3TE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS1PR04MB9309.eurprd04.prod.outlook.com (2603:10a6:20b:4df::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 16:48:25 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 16:48:25 +0000
Message-ID: <b1d587c7-8b54-4e49-84a2-0ae23378bb2c@cherry.de>
Date: Thu, 24 Jul 2025 18:48:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] want to clarify a few things about OVERRIDES
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <d6138660-ae8e-f8df-f8d0-994f1011564d@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <d6138660-ae8e-f8df-f8d0-994f1011564d@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0028.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS1PR04MB9309:EE_
X-MS-Office365-Filtering-Correlation-Id: 86cfb275-9f2b-496b-a2d0-08ddcad1e818
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dmM4bGRPRWNjNFdWbTkwOWF0OUwwZkljdmpBMC95SGZUTW5HYWpJTmM5ZFdH?=
 =?utf-8?B?TjVvMmNPTUlib012RmxVTW9HRk9Jby91WTI3eUVqVkIyWDlFcUxQTXhZSHZp?=
 =?utf-8?B?dGM5UzdZamhMYzlKLzhoRGpLblJSa0FzQmFlVnI2ZHlLQ05hTXAxRzUxYWt5?=
 =?utf-8?B?cWxGUkxIM1ZYeEs2T1c2a2EraWNQcUJZOFN4VmI4eVpNeVVxVjhHUmFhS09B?=
 =?utf-8?B?cWpQdmkreEFkekkrVDEwUGV2U2FnYzNYZERmOGN1TGw4Mko4UlF0d01IQ3Rx?=
 =?utf-8?B?UEViTUx4M0k2T082L1hSSmZKNUpzeGZtNEVlUDl2ekpObVpMMG5BcWpKV1o2?=
 =?utf-8?B?ejlCekZhUUoyN0RJWDFybjU5c3B0cTd1bG1heHJkR1VPVkZ3b29uZUNYMmNV?=
 =?utf-8?B?cC8wZS9rSXZnR05Rb1dTQnV0Y0lDUE01bWlQS2x3emFWT3BFemEyZDZ0U3Vn?=
 =?utf-8?B?SjhOd1ovazFJSHIwdmJqYmZPdDBYa2puZk8vRGdmdnAxSGpEM2FIY1BuSEta?=
 =?utf-8?B?RkJ6MzZwUUNpYnY5UW02QVRYUDBLaXlTY1pENXpKQXJwcjZ1YW42SVZ0c0RF?=
 =?utf-8?B?M0JuSUFDQzVUM2lPQ0lqUWdhYVE2ZkRDZmZNTGRiMHcwc0g3V3kvYVBndG9q?=
 =?utf-8?B?MEdBK0U4SHRjd1Q1alpabVU2RHV3NTR1c21JQlpwdWVzR1MyQXgzdEczK1dY?=
 =?utf-8?B?elZMbVZDL01SU3BPQjNFTmlhQlFSNzc1OEN5Qm10MWlZNFBaRFczclpndllF?=
 =?utf-8?B?VTNFeks4Tnc5aUFaR1ZTR3FmS2JvZktHTTAvODBhZTkrNnU4ZDlRRlIvRk5W?=
 =?utf-8?B?UDNyK29ETEZxcCswL3Ywc0RBZ3ZrNHZsNWJnVGd3VVFmaXlBTWttL3BUbzE0?=
 =?utf-8?B?TmdGWVJqUDBOenVjUDNQMEYzeDBuV0twUDIxeFFrQTV4UmxIejc2QzNoUmxT?=
 =?utf-8?B?UE9DbVFWREZYRmo3ZG9KQkpNemxsZGJmRkZMdEhZQ2VhdFBtTi94K3FVSDZQ?=
 =?utf-8?B?UHZRcVdyVFllcjFqdkt4eWcybm1IQUtRL0hZWVF6eGQ3TFdhaDc1SlowRW5Y?=
 =?utf-8?B?bTNGZE5zQ0NTTTBuUGRiSzNaLzNGaitqSllLNXY1KytYbk8rQndIL3lwNklu?=
 =?utf-8?B?UUJsaDZDNHVHd2ZNaWtEZ0hBbEF0WVl2L2MzTGJhWldweVRPY2ZkR3pTdld3?=
 =?utf-8?B?MUNUN09NejNxSG5rVUZtbThmaGVKdGc0Mk1kQjBPVzdybE9ScW5HMEJCdE56?=
 =?utf-8?B?MVFrUWptejNBRXpMYUdqUDFnd3IydWhjdnMvT29HSFpJTCtaTUpHTDhaNGNK?=
 =?utf-8?B?NEowY3BYMmV3djJmVHNWOXBVTFVjb05TdG9RZ2Q5S2tKb3RiZUxPeHBYR3Jr?=
 =?utf-8?B?ZEllWm1jUDZFSCtTcExjelZtTk5KbUcwV1FBUm1hNGYvMzNnVXNQUEtLbkhl?=
 =?utf-8?B?RWdSKzNDM2MyNFRQV1pqakJ0VERUaklkcTFKZzhHT3RZbXg4TDdFZGNNY3ZM?=
 =?utf-8?B?RWM0MktSYS8yTnROVmUzSTFGZEdjZHBmRGRtMkZJc1h3ZnAvOUhPVFZMWmpG?=
 =?utf-8?B?Z2RWaC9GblhLNFp3Y05vMlVHeEVPLzlBV0F2VzR4NkV0UWl5dDlJOVVGWkVP?=
 =?utf-8?B?QnQwRXVGRXoyZW42eWg0OXZyakV0cXlNeFZsbFFOOHdOU1kzcFo4bkJXdG1C?=
 =?utf-8?B?TFAyZUcrckwwMHVnWVA2S1liUU1BL2l5Mm0vdVd5QVdTNXNTcnhEbE00eFE5?=
 =?utf-8?B?ZmFBVlU4bTkrRDNxd0FmaDVWMWhEdmxxS2tBZjNNdFdtc1VyZG16bEp2TkVF?=
 =?utf-8?B?YTk1OGtwVWI0SFlWSFJvNjZOZmpDckJ4bWN4RVdBVEcrZlFOaTZhL2REdHd0?=
 =?utf-8?B?TlVhUXRyNnZ6SEdoUzNEaCtqL0M3SDlzSGYva3NvTEw1VE1jVWY1SW1TYmtr?=
 =?utf-8?Q?3Jh+p578gTA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dUtkdE1Ub1dvOTR3RmtPVFIzWHJEVGk0Vy83QWgrZWZGSGYxb2F2ZHo0bHh5?=
 =?utf-8?B?RlM3QytJRVVHbkdKKzJDODNEeVJCTkNjRFJWQlVTckYvY093aWFBS3o4dkls?=
 =?utf-8?B?ajZvOVhkNmNhVkNZWmtlSWlhRWU4LzdhellRRTAvZHZZT2ZVYTFUdDlsUXNK?=
 =?utf-8?B?V0s2RnJaVEtQYURWVGtMVlUxRHVtN2RrRHBFWXU0eGNkd0kyaitCc0xTblRQ?=
 =?utf-8?B?MlMvWFFvTERWZDJHQWQ2bjB5SjFNajM0eEp3QTB0MG1oMkQwYkNtRG5lcEtu?=
 =?utf-8?B?UWFPMzlMMk5VWFNjc2pwZ09ydStxa1phWWZIb29zaDFaQ1VGQ014UW5xKzhP?=
 =?utf-8?B?N2RRenlrdnRGaDF5WjJVK1NITzM1MllibDhVbXZnQmswWVRTMVcxUEIydDNj?=
 =?utf-8?B?TDhKRllkdmRqVER0cEJ3Wmc1ZVZ3N09Tc0tZS3ZqZE10d1NUMnF2T2hOR0Iy?=
 =?utf-8?B?ek5GTmtaZnZ1MTNFV1RPeGdlTk5YWG5DbTZxOC9nSFBjWmZ1bW4vSmRGVHA0?=
 =?utf-8?B?bnA3TzlwKzBiQlJoWkxnOTI5SlpWSHQ2VXZvY3QrZ1hNT2RMV3BDVHhmays2?=
 =?utf-8?B?VGRoM2hyeG8rWWN5RzNNMWtoRjBBVWh3VjlYNFNRRkVuaExrQ3cvT2VLSUpW?=
 =?utf-8?B?QmgrNnBQc1FSaVZoYlZkNEVBS3VMd2xCTHVnWnJEaUh5TXQrNmpETHdRWnNO?=
 =?utf-8?B?SnhMYW1QQUhnSjNWL1dvemdZbkVaVmxROTc0OHVldlpBelNVZlBENzY5UjUw?=
 =?utf-8?B?b09PdUVqUE9ZYm5acW9sQ1IvL29Gbmdybk80MFU2OGdyUjduVkZOSzNYZHhz?=
 =?utf-8?B?R1FxcFJOVmpMVm9KMGxDN2VUQXI5VFM0akJuNGRhMFVlRzZhbHhCVzJrbFJY?=
 =?utf-8?B?UllUSW1adVk5RDM1a0NEbFNMYjA4blRraDFzV3pIcWhWVTFBT01ldnBiL0xp?=
 =?utf-8?B?SzBTQUhYNlFjU2pFNGt0b2dsZytXUGVVOXZ1ZUdXZ3krc2JsRTJrMG5uUHFO?=
 =?utf-8?B?d2FpWnVaUzBuemt1M2dyRytEK09SaHIwQ3VzaE9HYUhxUVk0b1VpQkFrRjZv?=
 =?utf-8?B?MVNuWVU3dm9wZ1MxdExhWG1Db01HUGwyOTdGSFV3SU5OVVNsNDdoWllqSDZk?=
 =?utf-8?B?RjdxaTFMWUtrbzNDOHllMzl1dzZpNE9PaVhGYVg1QW5rVnUwSERqVVhiNExo?=
 =?utf-8?B?OXJvOXg1VDhYVlhkYTZUYlg0bnBaaGRRUDJ4akxCN1EzM3gxTzJCMXpCcVdn?=
 =?utf-8?B?cWNxMXphVDFudUk3WElWb2ZDdFY3VC9kRzBJdjVEOEZiWEUyU0NaVjF1Tmpx?=
 =?utf-8?B?WjNVaG5LdkROK2plMitIb0JhbjNRcllGUEs3K01qUUVwb2VoQlZzVG9tanR4?=
 =?utf-8?B?RWR1VHZUNkVER1dHTmw5MU1ucCtnUm1aYnhWUndqVGtkRlV2STlKeGI5YkNN?=
 =?utf-8?B?NDRvSk0rZHFaSDZoVVU1U0Nrc1c4UWZRdUpjRFZiWFJPTUJzUGdrV0RTS2Jl?=
 =?utf-8?B?NTd1K1FzZ0UrRXl0b0t2b0tBQUVnenh0a1dUL0x3OWhsVmdaQnYvQXlWemxZ?=
 =?utf-8?B?Vkp2ejRrV0xUUVlIcXdxZnYwbzl4dmVMbzhtTEFCaWZFR1JpOU1zT012bU1N?=
 =?utf-8?B?UmpIVXRSWjYxT1VJNHl4bHBXR2tVNUJKVnVNYy9TenYyL3FyQ2Vsc1FvWUJq?=
 =?utf-8?B?cjJZWkdKNWFIVksySE90MktaVERRM01GZ3EyYkEydktLYmpiWkZmcTAyVXlx?=
 =?utf-8?B?aFBKZnBmcWk3L2Z1N0FHdUhqNWZBVXpZQ0VlRkdnNXd1Mm5ISnFOaktOeHlG?=
 =?utf-8?B?VEFBKyt6R3RGMnpSbS9rVCtLcUJFSG93dDZma0NxZjZXcU9WR3lCQ3MzVWwr?=
 =?utf-8?B?UkJ3TjYwczc4YlZyclAyOUZBMHRwNlNMTG5Lc1Q2dGtQeVZ5NXJ1UldBTjk3?=
 =?utf-8?B?R0hveVFOYkR6c1B4VnEybjRNd1BMT00vM3lBVXYxRjlXWmpYQ0t6SlgrY3JF?=
 =?utf-8?B?SG8yM1hNNzAvYTdmMnkyZ3F1Yit4WFBPQ0U3QS9JUndmYld6SVBOU0htU2J3?=
 =?utf-8?B?R0lueU5TaFpDbncxV0hJbENBVHNJcGR1ZGJxUWtsUUl0S0xJbkpFdzRuekFT?=
 =?utf-8?B?eXkySFVmWjFOMTROMHJqQU50ZzlBUzdFc3FEQS9Hdi9iLzgvUWg1K2pHOE9P?=
 =?utf-8?B?UVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 86cfb275-9f2b-496b-a2d0-08ddcad1e818
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 16:48:24.9387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X8+5x3ChYXd0PrgYXhx1s17Rbtsh0aAgC0+chB7/v1BHvhNkezgl9gbF55ttU1hi/0fmNCPAMJ7MwablYVfi6Iira0+nUcznTde3TqoL7rY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9309
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Jul 2025 16:48:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7377

Hi Robert,

On 7/24/25 5:20 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    i think the explanation of overrides in the docs could use some
> tweaking so a few questions and nitpicks.
> 
>    using "qemuarm64" as my example, i can see the OVERRIDES that are
> set via "bitbake -e perf" for the perf recipe (broken over two lines

bitbake-getvar -r perf OVERRIDES

for the cool kidz on the block ;)

> for aesthetics):
> 
> OVERRIDES="linux:aarch64:pn-perf:layer-core:qemuall:aarch64:
>    qemuarm64:poky:class-target:toolchain-gcc:libc-glibc:forcevariable"
> 
> so far, so good.
> 
>    my first observation is that, when an override is combined with
> "append:", that "append" bit shouldn't be described as just another
> "override". IMHO, it's an *operator*, as in, it's just a variation of

Agreed. It does have a completely different meaning than an override and 
this is something I've struggled to explain in my presentation (I use 
the term "post-it" to explain the postponing of that operator).

> "+=", which one would never describe as an "override", so when you see
> something like this:
> 
>    SRC_URI:append:qemuarm = ...
> 
> to me, that's SRC_URI, then the append operator, followed by an
> override -- it's just the way i like to interpret it.
> 
>    next, when you have *multiple* overrides, like here:
> 
>    CFLAGS:append:powerpc:libc-musl = ...
> 
> i assume that *all* of the overrides must be satisfied (in this case,
> powerpc and the MUSL C library have to be selected).  but when you

Correct.

> have multiple overrides, it only makes sense if those overrides are
> orthogonal to each other, which makes this snippet from bitbake.conf

This made me test some other scenario.

What do you think is the output of:

FOO = "bar"
FOO:append:arm = "baz"
FOO:append:arm:qemuarm = "bat"

?

I would have thought maybe barbat and not barbazbat like it actually.

I'm trying to find a usecase for non-orthogonal combinations but failing 
at the moment, so maybe you're right :)

> potentially confusing:
> 
> # Overrides are processed left to right, so the ones that are named later take precedence.
> # You generally want them to go from least to most specific. This means that:
> # A variable '<foo>:arm' overrides a variable '<foo>' when ${TARGET_ARCH} is arm.
> # A variable '<foo>:qemuarm' overrides '<foo>' and overrides '<foo>:arm' when ${MACHINE} is 'qemuarm'.
> # If you use combination ie '<foo>:qemuarm:arm', then '<foo>:qemuarm:arm' will override
> # '<foo>:qemuarm' and then '<foo>' will be overriden with that value from '<foo>:qemuarm'.
> 
>    that expression "<foo>:qemuarm:arm" makes no sense to me since
> qemuarm is clearly(?) a subset of arm, so why would you ever combine
> those two overrides in the same expression? i think anyone trying to
> understand overrides reading that comment is going to be confused.
> 

That's fair, we could simply replace arm or qemuarm with class-target 
instead for example.

Cheers,
Quentin

