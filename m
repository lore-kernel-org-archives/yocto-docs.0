Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EFD3CCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 10:31:59 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17529.1762165911048787874
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Nov 2025 02:31:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Fg2dbcBJ;
 spf=pass (domain: cherry.de, ip: 52.101.65.32, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wqWKX5RTWOPP38Y7TrkXn3xykWn88qx09y8Fk772IjXe1bku4f6lYCG4099PSSlcigDe03wtzX540Rf1uflr8NtWmG0xcUsTpD+qk9J1sBFbB2/Y36sw5/HpKKisWK6XKj2XwSIwkchN0hChLieM8ceash7qOHFntIqpFOqlqmDI5hIrHPtaiZwe6Z7tEpHU47JLgJFlNi72qCLftK6Mhe0zifOfZpT0aIXQHatGl7f7yi44bUuvYvlV9lQzYniZGv5lCCLi8WKBq9UxmvTeg3V9exTigE5P4E8mXnpOFza/tm6OQ/nZikwGdJ+9tsNMs+c0xiEiaIlyKIrnMROwfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5qts/HPkGDTTlqnGDDR4uM67O0elzZHt+rd7hd7t28=;
 b=mwWgilHc9bMUpRQ5wmBqe0oOy5qw3RTO7UjgK+V4DgX3QZRObZFA48nHN1U7zvs5A3YvJT1tIfTeWU+mRC89kbimF6Y/OHTIUGhpHUGJDc40O6F2seleQvFwJkC/3DgoP/Lh52h79j8n/heiZaQD5ny8pdQk8iJvFKNUBLUP5tABdjZfIyXgB/kfxoSDqj4iRnpjkrnJgc4F+vFqPpcerFpQ20XkqgfRt3vHndMXrezYqBVa/37OPuQfiv3MkeEXfzD3FCYRFLp98m9LuNcKRs09NMTSOAKEY8WrKZsgkgas/4q2EWjWdO1n9KcGBm6F6wH2GCIJ0EMzT09z0Dtd7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5qts/HPkGDTTlqnGDDR4uM67O0elzZHt+rd7hd7t28=;
 b=Fg2dbcBJlAAygPydhIaHsZkrCZoPBW9ks3tFw1vxmLJFrcNHc/UFGqUBPRL4Oxa53kvJSHKQ83aDJnABMKyuEkDqw2Gos8RfJuwK9wwljPbmSDDB6sgJck8UeH88UTgYjIyd+gLBm75D3xY3WhyJlpcQbI2WWfCi4O8cjPoeCCI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS5PR04MB9755.eurprd04.prod.outlook.com (2603:10a6:20b:650::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 10:31:47 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 10:31:47 +0000
Message-ID: <f8465d4f-7edb-4c94-9885-99a32548af3c@cherry.de>
Date: Mon, 3 Nov 2025 11:31:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] examples and docs for COMPATIBLE_MACHINE are inconsistent
 and incomplete
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <67c6ae2d-687d-6679-c5a8-c2492a807ad2@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <67c6ae2d-687d-6679-c5a8-c2492a807ad2@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR0P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::13) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS5PR04MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: 6af1cbac-56ce-4bba-5045-08de1ac43104
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZmdVWXp6b1lwYjkvbG5RM2JsU01RUGloVFpvT1ZWSy9WWnE2NHUvNnN2aC9X?=
 =?utf-8?B?OVovcU5maEFlcXlQdUVIRElUMDdObVRMbWo0OGZ4QXdpSFhzQTFLYWZYOURN?=
 =?utf-8?B?bHl6MFExMDJqQ2c5Tmt4am1aY0RCYjRhdVAyRWhRSy9iTG5YdEVjY0hlcTNt?=
 =?utf-8?B?VXdMeENrM0JFVGRCd3lkaXd4OStwRUtFOThCbXFUSEVWYlk1M05Ba3BFRnpE?=
 =?utf-8?B?N1N4Nm9jODB0OHRNbW03UURlV1MxQ0NSNkR4U1VkV3U0SUM3TWNIUVRGMllF?=
 =?utf-8?B?RTdGQ0UrcGdPUklKY1hWWU9aQmVVVTV0RVRuQ3Y3ZGZ2aGVLTVRZT2JsRVhj?=
 =?utf-8?B?UkpTRE90VFo3eGdNbUpMT0F6Y1BQRzEra3N0Zjc4eCtDczBrSXFqRGdXQ0Qy?=
 =?utf-8?B?OU0vL2pqSjBiaEpsUjNsWFZxNnl5Q25IY2trRmd6OXFUN0hUSFZqL2ExNGZx?=
 =?utf-8?B?Uk5zYmxKRFZPVDFSdFMxc24xQ0dGT1Fsa0dUYUtIMnpLdFZSMTRWVENHUml4?=
 =?utf-8?B?ZHM3WGRnVWJrUGZHT1VEL3FoUEd6T09iUWVHY01idGdsTlRBYSswZm81ZUhq?=
 =?utf-8?B?RnZhNml0U2E1QUduSFNaMkpZd0JrYXRiSWFOcHlJMXg1M1JlVUpKL1lDRmxa?=
 =?utf-8?B?bUxTR2M1anFxckllSWo0WFp4MzRLalVGNUphZVB6VVkzSzR4eTd0V09vZFFs?=
 =?utf-8?B?N3RhNWJxbnVPMDY1amdMckhSMU1NMkYrUTJLVGlyVHRkOUVvZzFNdVZGZ1c1?=
 =?utf-8?B?ajYwbmkvOVU1VlN6cDE1SnN6QVUvcktleDR3Sjlhbmh6OUpZSGYzWnhlZkNP?=
 =?utf-8?B?a1h2Uk9xN1BOQ3pmNHl3WjRqUHdlQzAxLzZudjZyRTBBeGdFR0RBZlRxK1dt?=
 =?utf-8?B?NGdUMmxvNU5ZL3dxNDlRNXMrYXdLYmVXNmZEQi9rZDZkcGRobVhwcm9leTRr?=
 =?utf-8?B?azJQWjUwWTlGelVMSjRnVDY4S2ZhOXFZY1lJRElmb1h2T0pJRjBYOUkyVjJX?=
 =?utf-8?B?RDRnSEJWdXdaODQxK3VoeXBsdU5JM3JXTnhGUzdGU2JVZzNBU0RoeUJIN2FM?=
 =?utf-8?B?UnZERUhDZ1Zydy9mVG9IVGdGSkdsZ01TWmc2YkNBMklOM1ZhejNaeGE2TWRI?=
 =?utf-8?B?K2FtN1dOMUpOUW1ka0RUcEZKNzdaMVBTaTRqVjZYWGlqQWJLQzJKaGRUTXlz?=
 =?utf-8?B?VFlPTi9abFFDUFhwMUtjUUxSMFdxZFUxLzZHM1A1V3NueUNuZGduVCtPNzZP?=
 =?utf-8?B?UlZkMnc4WWFpbVdObUs3R2llZzlFOHcxaEZIYUt5ZCtXWXJPQnlPMzNaemFl?=
 =?utf-8?B?RG1JTnA5WC94b2FINmlwMHhwSWZscERBNWxlVkw0UE5uRElzWFk1MTNNdlUy?=
 =?utf-8?B?OU1XNmpIcTd6NHg3K2srNVFyRHlwcEU5dnRnUGsvVjhNUEJ3UGpTeld5ZXhC?=
 =?utf-8?B?bVNjUG0wb2hMV2Y1L1haMC9ZY0drR1Z3ODMvUDhJTzV4OXc1WjRyTUk4TkNh?=
 =?utf-8?B?aGIyM0FLTktLWnd0ekQ5WEh6Qm9pdDM4ak9IRmFESGMzRURDd0YvcTdVUFpF?=
 =?utf-8?B?WE5ZbFFLVmpQeXNGV243Zkp6Q0hCYmRHMTA1Z2ZpVFQ0NDFMVWdscHVxcS9n?=
 =?utf-8?B?d0RtVkx1bGI2TXVzcVZXK3lGenV5eVdwUENIaHVzY2hlQ2V2azF4a2M3eUlH?=
 =?utf-8?B?OHJhOVdzWjRNc3pmTVNPZEd6UnQ1S0M1UGxwTjhKSWwzM29rYjl0cmtxU2px?=
 =?utf-8?B?cktqUHhick1aV2F6cU4zV1U0NjIvbWVRU21IRlVCUERXWXA0MWZIWjk1eGM4?=
 =?utf-8?B?eEwyVmVyeVgvcDg2dERac05ycmVUdnU4OFBKc28zWDQ2OHI2aUdncWZTZlVa?=
 =?utf-8?B?Q09IMGJKME1HVGRsN1RkWUxSY1R2Z05UMG91UUk0c1lFMGc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VGFXbWg1dVR3WDNLT20rRHUwTEFibXo5U2FNb0VkaEJnUENIejBkWEo1TFhG?=
 =?utf-8?B?VUFDUURXZXJqUnNub2JxOEpBeEpJS3NWR2JUbkdKL3QxS0hBSkY4OVd1c3pE?=
 =?utf-8?B?eDVUSEwyRGFLdUU4a2l6NllVRnh6dkE0VzJFeTdDbjltYnREK0d4Z1VMS0dM?=
 =?utf-8?B?MUhxUlBPOGRENW5PeTJ2QkJvd2ltMlM4NjBnaGJnQkJSeDhIOGNvTVdxTkVF?=
 =?utf-8?B?dHUxN1ZBUnIvOTRHSENPbVF1YU4zQ0hjWXVtMXE5YXk3bEFNN1R6QmhQT2tD?=
 =?utf-8?B?eUpKVDBreExvd2ZhQmxSeXdrdWU0dDQ3OW9qRU9QUzhMaERBaXErMUdYc0N5?=
 =?utf-8?B?WC9rUHFsRnBUOVQ4QUpFcDlYMUJzdmQ3eEN4UWlLVkJFLzBzaitVUWluUXVT?=
 =?utf-8?B?S1llVG9aaHl5dDczUXl2aDVtU1N0blNuYkpUbVhHWTU5cFpyb3dydVFiSExn?=
 =?utf-8?B?OXVub0lQOHh1RVFiSDJRYUpERlluQlV4Wm1jTUpaRmQvTU5JL3VldENJT1F1?=
 =?utf-8?B?aTZIdXI3S3U3dXFaWjViTm5MUVhNeXR0Vndhd2x1WitaVG9IREw1MDVwUDgr?=
 =?utf-8?B?aGRvNkFPVi9aWFVwbm1BNk9Ebys5anBhUjBBd093WkNyeHBFWnJsK0o0RzdY?=
 =?utf-8?B?Ri95UUhKY21TMTRLbyt2OXVSOE9WNWR4QzVUbUllY3JvaVEvM0UzczRMbUhW?=
 =?utf-8?B?dTg1OVBIV0ZERDZ1SENZK0Y5NlVHci85eFpkMWVUalpPWUtxeTBxVEtObDA2?=
 =?utf-8?B?eEE0VzZxOWhzWU9vYzQvY0JMUi9DdmQvQWYyb0RpR1Z6Mnc2OUZlSXVGaFlq?=
 =?utf-8?B?MzNqajQ0UUcyUkRmYy9SRnhxc1BZQlhhY2F1K3o1REdGcWJpYVBINEZ3NHZI?=
 =?utf-8?B?bW5EQ0JPU1hCdDErRjBJcVdyS3A3bndHUzc2bGt6ejMrQWxWMDZ3MXRLY3k0?=
 =?utf-8?B?d1ZJcWh1b2t1UlhVcDZqbTYrdWhKcWJjcGd0cHRtdlkxalYwZFpKTk1XL2hz?=
 =?utf-8?B?RVUvcEx6bjFYdUhORktQMWhDa25hdm52QVdYSDdyaXVjb3psUFJpdlBvWmVa?=
 =?utf-8?B?QjBnOFlsOG9jWVZaRkJFTWx3Ujd5TUZsUVROdUFrYTJFV3huK2RhWWgzNTdv?=
 =?utf-8?B?Z3BxTDJjb01EVnpld2xrMzVoUWpwMVY4N3BNN2hlU0owb0RycGZWOEVCb3dr?=
 =?utf-8?B?ckM3MUprTDZiZ1RmbXhHVEtDWm9OUjA5aWo3YVY5dHZnb2tTVm1vUWppWEVU?=
 =?utf-8?B?TUVnT0o2bTZtZUdqOVdWV25lUXRRNk84T29BaE1JYmRLeWxFdEdnT3VhZE5T?=
 =?utf-8?B?QTE4MERwcUwyQUVCN0kwdWNOSmdaK0F1RndOQjdmYk9nVU40bTk1LzBNSWpt?=
 =?utf-8?B?UDVYcWtTdHgyV1VOUEFYL0k0eHJHbnliN3VzUUN3S3ZqZlhUNEdlOHVvclhk?=
 =?utf-8?B?Y2MxQ2lhVDFjbnY2U0c5akpVY29MYWRIYVM4UDBIemtnQldzSndFSk9oU05x?=
 =?utf-8?B?RkNjNEMwVzhaTVNxeE5MRGNYMndDTFh1TG9LNUw3ckdTNWZQcGI4bUxUbVZI?=
 =?utf-8?B?Mjd4RVdRdnFneEVFSFNyMXFpcmFFOUoxLy83OHpPNXhiSXJGUjVEKzlWT3F3?=
 =?utf-8?B?SGd4aEFoclY4STZrem84YjREUFpjYTVod1hvUDI0eG91TEtwdUFOTFFlQkVC?=
 =?utf-8?B?bVRSQUJzKzFmVm1OZFhRSGpRQzBGT0FkVEFDYm5ObCttMlBLUXZpYW1zRng5?=
 =?utf-8?B?d1RDYStKR3RXTjFiQWF2MlBpUmh0bXhNVnFuTEZnanV6cW96WDFTM0hqZGRG?=
 =?utf-8?B?aEpVaHRacnE0SHVaa3FCZCtYUnBSaG5BeE5lVkJpalh6VXZSWXN4eWR1V2JO?=
 =?utf-8?B?a0N5TlVRU1lKTEx6cytQQjQ4Q2t5UktKbm1QdzRsQVFuMUM4TENXdmZzVzJG?=
 =?utf-8?B?dTRORTlZSVdqdm1Zc3lmR2xWRThPWmdtekpEZHJuTi9BdkU1aXJLSzRwZ0N5?=
 =?utf-8?B?WitSbnBoa3hZVElMZkJtZzVmb1V0S3F4c2ViMVdxZUFyZVRDRlI4S0N6NnNF?=
 =?utf-8?B?K2lwR0JmZTQ3eEx1cC9xeklseUhhLy9SZWJjdGFtVG9LZ2ozVXJiQjJjK01F?=
 =?utf-8?B?R0Q0ZUVnMEZwYUp0Wm1uS1h5QzJ6dlBVY0VQaEZnL20rZ1k1eG9sYUJCMWpY?=
 =?utf-8?B?OVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af1cbac-56ce-4bba-5045-08de1ac43104
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 10:31:47.3723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KmcN6tQ1OmPs8E4HVe1KfEBanqJ+D3xvrQnwNfEpZ/oq3bu0C/qnG6cr83awWAD+zY4CyH/KYpj+QjkoYWHx9diqd2o9DtqJifm5oZDLzGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9755
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Nov 2025 10:31:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7965

Hi Robert,

On 11/1/25 2:46 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    i know i've whinged on about this before, but the docs discussing
> COMPATIBLE_MACHINE:
> 
> https://docs.yoctoproject.org/dev-manual/new-machine.html#adding-a-kernel-for-the-machine
> https://docs.yoctoproject.org/ref-manual/variables.html#term-COMPATIBLE_MACHINE
> 
> don't match up, and also aren't consistent with some of its usage, and
> also doesn't cover the variations in the meta-yocto-bsp layer.
> 
>    first, are the strings provided to that variable normal REs, such
> that they will match longer strings in which they are a substring?

https://git.openembedded.org/openembedded-core/tree/meta/classes-global/base.bbclass#n567

Python regular expression stored in a BitBake variable and matched 
against each entry in MACHINEOVERRIDES (left to right).

> that seems to be the rationale for the anchors ^ and $, correct? so
Yes, those are anchors for start and end of RE match.

> this example in the dev manual does not do what the typical reader
> would expect (at least it's not explained if it would match longer
> strings if that's what the example is supposed to show):
> 
>    COMPATIBLE_MACHINE = '(qemux86|qemumips)'
> 
> or am i misunderstanding? given this other example in the variable
> glossary:
> 
>    COMPATIBLE_MACHINE = "^(aarch64|mips64)$"
> 
> the average reader would be entirely entitled to be confused.

We mix both in OE-Core, though we likely only want the latter form.

The former would also match qemux86-64 and qemumips64, which are 
machines that do exist. But the docs doesn't seem to be explaining that, 
so I blieve it's probably not intended and should be fixed.

> 
>    next, parentheses would seem to be superfluous, as in these examples

Are they? I don't know which one takes precedence between the caret (^) 
and the or (|) character for example.

> ripped from the code base:
> 
> meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb:COMPATIBLE_MACHINE =
> "qemuarmv5|qemuarm|qemuarm64|qemuriscv64|qemuriscv32|qemux86|qemux86-64"
> 
> (again, without the ^ and $ anchors, it would be possible to match
> longer strings, yes?)
> 

Yes, try it. I actually made the mistake years ago (cannot find the 
commit anymore, so maybe it was in an internal company's layer) of 
setting COMPATIBLE_MACHINE = "" to disallow all machines by default (you 
could then override from a bbappend by setting COMPATIBLE_MACHINE to the 
actual supported machiens). But this didn't work :)

  >>> import re
  >>> re.match('', 'whatever')
  <re.Match object; span=(0, 0), match=''>

So we need to use "^$" instead.

>    i don't see in the docs any mention that you can use wildcard
> patterns, such as:
> 
> meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb:COMPATIBLE_MACHINE = "^qemu.*$"
> 

This would be the same as

^qemu

>    finally, there are these override usages from meta-yocto-bsp:
> 
> linux-yocto-dev.bbappend:COMPATIBLE_MACHINE:genericarm64 = "genericarm64"
> linux-yocto-dev.bbappend:COMPATIBLE_MACHINE:genericx86 = "genericx86"
> linux-yocto-dev.bbappend:COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
> linux-yocto-dev.bbappend:COMPATIBLE_MACHINE:beaglebone-yocto = "beaglebone-yocto"
> linux-yocto_6.12.bbappend:COMPATIBLE_MACHINE:genericarm64 = "genericarm64"
> linux-yocto_6.12.bbappend:COMPATIBLE_MACHINE:beaglebone-yocto = "beaglebone-yocto"
> linux-yocto_6.12.bbappend:COMPATIBLE_MACHINE:genericx86 = "genericx86"
> linux-yocto_6.12.bbappend:COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
> linux-yocto_6.16.bbappend:COMPATIBLE_MACHINE:genericarm64 = "genericarm64"
> linux-yocto_6.16.bbappend:COMPATIBLE_MACHINE:beaglebone-yocto = "beaglebone-yocto"
> linux-yocto_6.16.bbappend:COMPATIBLE_MACHINE:genericx86 = "genericx86"
> linux-yocto_6.16.bbappend:COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
> 
> whose usage is not explained in the docs.
> 

It's just a trick to allow the variable to be built for a given machine 
without modifying the original recipe or variable.

When building the recipe for that machine, COMPATIBLE_MACHINE will be 
the value of the machine, building for another machine it'll be the 
default value (which may not contain the machine name). Nothing specific 
to COMPATIBLE_MACHINE here, it's a typical OVERRIDES mechanism for 
setting a variable.

Imagine a recipe with

COMPATIBLE_MACHINE = "qemu|genericarm64"

Now in my bbappend I need to add support for my machine, I can do:

COMPATIBLE_MACHINE .= "|my-machine"

to do this.

However, I believe that when doing this, you also change the value of 
COMPATIBLE_MACHINE value for the **all** other parsing of the recipe for 
other machines, resulting in invalidating the cache for this recipe for 
other machines which now need to possibly rebuild stuff.

In any case, it's simpler to write

COMPATIBLE_MACHINE:my-machine = "^my-machine$"

So 1) I don't have to remember if I should be using .= or =. (or :append 
or :prepend and where to put the |).
2) The COMPATIBLE_MACHINE variable is easy to read when inspecting the 
recipe

I would welcome docs patches for explaining the string is a Python RE 
string with all it entails and make explicit the implications of missing 
the caret and dollar chars in the string!

Cheers,
Quentin

