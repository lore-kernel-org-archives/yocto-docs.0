Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 612C1C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 15:07:36 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.86])
 by mx.groups.io with SMTP id smtpd.web10.11151.1647961655055407251
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 08:07:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=L3lvyIMC;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.86,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wy2pMeQ5EIb+undAr9/8oYIOpDx1LQ34alj3+aK/6/rp0YfQczwOrTFKf43uMBdkdojz7i6uooRyL88V6w8KcBZUtdZF92IVZH4hfpX2ry5XCbXjT7Dj9dUKWtLxqsdhMobhZuk9OMvW+12pIL9YM8whMliTc1DN2dNMELuVdCSV/25FnDFp9TJf6Nwqsf0zYMM+CZtivM96qoEjW+W6L/thCWVh9faQfdmddP9jusGek8Rov848nfT9qrm/l9tOWnDg0a6RbvAwnJHDfmnxiZ2hF2KOI60BJHm5oPLHXRHFZrjtHFnw48r+VQ30V5VHU51RMk38DHY5SzR80YjD9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n67Ps5Io9Y1Jsksaiu4BLmij+azbj6r4wV5gQq/jDvE=;
 b=HdWzP52tBr4rzhKilDXTtBjU2hYL7wSdFM2AGSYXz5EEbRBQL3j/v4HIEeqIf4XTIFOLaRP3c/qQhx8ajNSlvq+ESsrgF316NzUjI4cH9j+OBhDjPr7FEFJjcKhAmmdt1fQH97edeAPRea2LnIdMHRlHrFXGMccnbzKy44furZ/4VKpFqAxNmueULzZMKLzhVZ6O4hIQRPLe/Z3+JpjIx/t+eU4bJk2rfl0ehQqEK7fTcjmhVzTF1pG+Y5Og22q/k17HkX2bXsMMk/ZdqGAMymWE+M+zOYaZJJaHrkpvIxxpKs9ZiGVW/323c2jI2VazxqrgUvBZstPaWeF4oG9B8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n67Ps5Io9Y1Jsksaiu4BLmij+azbj6r4wV5gQq/jDvE=;
 b=L3lvyIMCGJyWmwEraS2UqKNFsX80anPMtHK80HvoBOKmGrU+PPYymlqRe8r4Bi/C6UFqiOVsrkhQ5FETfplsYMGo0osyfKRCBF3OfKff+bzqgaMdt+8NUtwW+5+qRwdMFWBEhFR4WYpno8Q6B9oKei2sYn9B2sn9bqiN9G6AxHs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by DB8PR04MB6762.eurprd04.prod.outlook.com (2603:10a6:10:105::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.23; Tue, 22 Mar
 2022 15:07:31 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391%7]) with mapi id 15.20.5081.022; Tue, 22 Mar 2022
 15:07:31 +0000
Message-ID: <12d7e460-f3ef-e32e-ba12-316ba97b6f71@theobroma-systems.com>
Date: Tue, 22 Mar 2022 16:07:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [docs] [PATCH] [honister] docs: fix hardcoded link warning
 messages
Content-Language: en-US
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Quentin Schulz <foss+yocto@0leil.net>, docs@lists.yoctoproject.org
References: <20220322142502.550191-1-michael.opdenacker@bootlin.com>
 <f25caea4-29da-e9ed-f941-68615d737f3e@theobroma-systems.com>
 <8f843dd4-6d50-4c67-8d2a-388c6a051798@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <8f843dd4-6d50-4c67-8d2a-388c6a051798@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0066.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::43) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8613805c-23d6-4a19-5cab-08da0c15afc5
X-MS-TrafficTypeDiagnostic: DB8PR04MB6762:EE_
X-Microsoft-Antispam-PRVS: 
	<DB8PR04MB6762B1BE8EB76C58D2CA51C2C2179@DB8PR04MB6762.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	i+9IY6na7j61uj3MxYwiKYsewNljQd61zEmWo5ygpWfwWhP83Nef0VTyCYG+HDOc2MhpKgRZ5flti5RRr7R2WQmFOa9zY2fMOOSlkvrJIwgxEwRIp/prODmRi5LC5TjZy/nfxW+coQUmDKxrLRh/dqtKH8eARlNjC3k3LST1nFrYeHeFsZdBvEf9O0bLLLKuoCvidlNOZdm8jEX8yxL/zyWqiXeUSNIEzwQS17NLuEHaIgLS92tuniRJ0Gec9cFHiv3VFR59YH3xUmLwxc8AuYRuPjqOGQdOT7xfEttwSms1bWc6GwanZv//pEJ90Rqx7VOaFnHo5CjiX+icTaA3KoLa5a8O9P706NqjVTb4NvzxtNb3xooTDViDw48T/OrkIpAzTHnvNOz2QrsLuCqGoEnsHNXfQBQvXBl7hzM1JUr6D+tjLTtigP0Q0kJIlpZMx9W8TAdF5LFiEmZQsLk9RZEhYwT9466PVmzoSxsM9YXXf1mYCNarJlY/eozl3MKmdEOu+s1w+iRvUUf5/2QMpGMPqA/QBv3qcOY9gRVdMG2W9bIemxBlSAKyKANHflu4IRSU/WMJFcHQI6ykC5zlBrbPpzXYNg+V86+BbfGsBHUeMeg+V1ZklXHxZ2ot4KVawndU2MSvHg6ti+G5mYHd+NJymesD2gCoIzV6hwsv82M75koJ1/VZlAE4PTfoJy+n+a4M3tnlmBF+vrGrbHNkyvy4bIEanJVjW+bDUnn39wWaZalylmUHqCQSEHnO3js5QWsW8GGePV0MJ36HPVs1rbFljPMaHXXfQgiq2GVMa5S00ka/ZDtqZLi/8ZBXD+GNu1OFQoT/s8b/5HrE4MK2cw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(86362001)(31696002)(6916009)(6512007)(53546011)(6486002)(83380400001)(8676002)(31686004)(36756003)(15650500001)(4326008)(2616005)(6506007)(316002)(38100700002)(44832011)(8936002)(2906002)(66476007)(66556008)(508600001)(66946007)(26005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Wno2QmMyaVR5U3FYMERzaE0xZnpsRlJ2SVozU0FpZDRIRWFsUTVqU1BkRldM?=
 =?utf-8?B?djI3QnNIMGJmOEtFS01VNU1BNm16VFJ4YkU4UmpaMnBVVER0VFd2VFo2Q2dl?=
 =?utf-8?B?R2x1LzRyb0V1VlVUdjdlbDNMc001dHF6YVVtRnoxTmY3M1VwcisyR2QyaWtZ?=
 =?utf-8?B?OVpBZXlMOEVLNGV1Q29XT0lHaVZaSDFNNTlod3V5bmNEdWVBbGRmSGJSY0Yy?=
 =?utf-8?B?aExicUx3ZkZHcEcveFdoejgvRFJsTDBlZFZvNS9iWFZITitoNndocURuRWhH?=
 =?utf-8?B?MEhvTlNBQ1N3cnF4SzA0UU9zTnI1d1NEcVVhQmd5dElmcGtFVzg4VWxKRXhS?=
 =?utf-8?B?ckxRTlExVWV2WUttR2VWbmdWQjUzMzRMVXFqckp3OVNWbXgvdkJSdnNtdzhT?=
 =?utf-8?B?QzJhRzJ4OXV2RTk0N0lSUjkwR0p5c3dVN0xNZHBrNFNJWGZWZWEvbVNnNGM5?=
 =?utf-8?B?TjBMWUtPODJ5OUFQaGF4ekdvTDBEdnlPTlozVzE2K2FxUnhqRTl1VDcvc1hv?=
 =?utf-8?B?ZHFCNjVDZUt1aVozOURIZGFISWZtUzVReElZNE9wayswbHBxVjZTcGtxWCtX?=
 =?utf-8?B?Qk5UVlIyUFB0V1J5RHF4SWNmVEtEV0d4WlVvTXhueXpPcEcvV1BHZHowS3Z6?=
 =?utf-8?B?b0RjVmVlRTc3RzJMT0cwbm10eWYzWnVhYUNZV3l0TU02VDQyamZIYjA4K1Fl?=
 =?utf-8?B?MjhnM0ZxMzh4NWZPbWQwQjRpcmRWQmhyN1ZaOG5kZlFYL2kzZ09UdFBpUGlK?=
 =?utf-8?B?QWRBVGQ2TWdGdVJubVNtMklpenlsL2hSbDZmbGJkZ0lWS0NWQ3NLQUlTMCs3?=
 =?utf-8?B?cHNYN2diakkzV1FJMnpNdGRJYTdpTFNGNFNVUStVUnNKNWFETTRaZmdxN0JJ?=
 =?utf-8?B?Mk8vYmdLUFF1V0hwVHRVMkVGZDVYTmtuZEdpZlNidGs4ay9WNTFkQUpLcTdl?=
 =?utf-8?B?SlArc3cxeU9IU0V6Ty9QUFFjSjl3ZzNFRzRwSlBZOU1hRVBTZWZkeVNTcUZT?=
 =?utf-8?B?Um9QMnlhdjkvZkFCVWg5OGM2TnZHMWV6NThkVGhIdjZma2dGNnpuSnBMb2pO?=
 =?utf-8?B?ZFpjYmhrTEJzTzhrNllPTndtSU82T2NIc2d0RDF5Q3VEUFFZYTZWU0N5RTZv?=
 =?utf-8?B?QVNGVXZyOExLWUJlUEZ4Ylk0cC9ZVCtZNWh6SWpSNWVQOWdERlNDdjFEQWFm?=
 =?utf-8?B?am0weVFXWk1rSGxyTVZIclM5WEg4Qnp2NWtsNkhncnN3M3ZZUkhNLzBWMHRW?=
 =?utf-8?B?MFBqa0F5UWFRK3dIREVnNGVwMmZQMFpWdjJweWovWlZtamZtQkNpZE12czdz?=
 =?utf-8?B?VlYrRWtkUHpFNURPN2JPZ3JkQmk3djhGNXQrOWRLS1pMV2VXWVQzZGQ0cUVa?=
 =?utf-8?B?d0MzSGdGRmE4YzY0NUZqRUhyYmFUdFVUeW1EMW9Xcmt6bU5XY2RuRG5uTHg1?=
 =?utf-8?B?UzJlY2F0THhmZXJhV0JlZkZhSXBIUnozWU9mVG1hVGhuaHZ0a3FwbHg5SUwr?=
 =?utf-8?B?RmRyVWR3TkxCVzlrNUNtZlhBeUhHRmVCRU1rYWFCejhySEpDQlRWbEZKU2N0?=
 =?utf-8?B?dVpBOS9iWnlzenhRRTFrY0xEYXNiMDRGTHlJVnVQbHFNeXpUYzRyUGgxV2wz?=
 =?utf-8?B?M1J0WkdsdmMxQTkvMmFjWnpkdERVLzh1cjBWWm93RDdDaWhxb0dOYlp4SzR5?=
 =?utf-8?B?L2xYcGZnYVVXS2U5SE4vYy9Tak4wUHQva1ZwcmdRRGZ4TVIrZjYyTGJyZ2ZM?=
 =?utf-8?B?N2dIMEkrODBhVlZhQ2taRFc4RlBzcEplcDA2bWVlZkNCdURVNWRjcXBwbUtW?=
 =?utf-8?B?MnhORWZtaXZ6bTE2bHFJNUhCREYvNzFYNHVmZVhSaFAybWtheGd6UjFQREZG?=
 =?utf-8?B?WmN1MGVhSTB3Z3JzekkzNzFLVnNDZ1BKcHZZcnM2ZWFhdGUrZHBhbTF2VGtS?=
 =?utf-8?B?TFFSTXQyeXNHdXRUZkV1SXFic29YdnRsUkg2QnhPakNFQy9XQ29DMUgwWnJv?=
 =?utf-8?B?NVROaDU5YWpWZFJSbWFsbkw2S3ZYY3VDZzkzS2gxT2tJYUMyc1Y0eXYrNzhY?=
 =?utf-8?Q?JBjuDJ?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8613805c-23d6-4a19-5cab-08da0c15afc5
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 15:07:31.0702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cmhm+zAI60qy2YpfOdljABCEABwc1x6rM2y2OeY/XWcntahabOsP+AeHNUqTIZ49iREuq1nCwcJYShf2RemxlHbvQr5HX0/dd02F3338AV/LrsO1XBrTHO3VK9h1FeHJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6762
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Mar 2022 15:07:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2690

Hi Michael,

On 3/22/22 15:58, Michael Opdenacker wrote:
> Hi Quentin,
> 
> On 3/22/22 15:35, Quentin Schulz wrote:
>> Hi Michael,
>>
>> On 3/22/22 15:25, Michael Opdenacker via lists.yoctoproject.org wrote:
>>> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>>>
>>> Sphinx complains about hardcoded links which can be replaced by an
>>> extlink.
>>>
>>> So let's apply its recommendations.
>>>
>>
>> If Sphinx is now happy,. I'm happy :)
> 
> 
> You were actually the first one to have a recent version of Sphinx and
> propose such a patch for master.
> 
>>
>> BTW, you might want to send patches for honister tags to
>> yocto-autobuilder-helper too otherwise we'll have build failures once
>> we update sphinx package in the doc toolchain.
> 
> 
> ... and for dunfell and hardknott tags too.

Actually no. Those releases don't have the -W flag set.

> This sounds like a lot on not productive work, I'd prefer to contribute
> to "master" instead :-|
>

There'll be work involved for each Sphinx recipe update probably.

> I saw your latest patch
> (https://urldefense.proofpoint.com/v2/url?u=https-3A__git.yoctoproject.org_yocto-2Dautobuilder-2Dhelper_commit_scripts_run-2Ddocs-2Dbuild-3Fid-3D8273124feb9da2ffe93fcee7c4529d5597e1684a&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=7KvpXu-zWDEHrScQwpPEb1d7lQpqDn3tM0R6OX9vQ-setWP9vzh2eAaoa8Kh6YRC&s=jAUfJi_04ri8OvUg8fg9WTJCBYEqLd6QPSd08IqlW3c&e= )
> and I understand that we don't break docs anymore when there is a
> failure. But what about just ignoring warnings? At least these ones
> don't have any impact on the generated docs.
> 

Missing terms from bitbake are warnings IIRC and it's quite a big deal 
if we're not failing on those. I guess if we were able to mark only some 
warnings as errors, such as is possible with compilers for example, then 
I could imagine us doing something like this, yes. But in the 5s I 
looked for this I didn't find anything :/

Now that sphinx will be built by Yocto, we'll probably have much newer 
versions of Sphinx with more and more warnings (turned into errors). 
We'll need to see if it's worth patching or not or if we keep older 
toolchains (which kind of defeats the purpose of using Yocto Project to 
build the toolchain?).

Cheers,
Quentin

