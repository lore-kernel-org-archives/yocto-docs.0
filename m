Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D944CC433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 11:39:09 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.45])
 by mx.groups.io with SMTP id smtpd.web12.7031.1651059540907352133
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 04:39:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=k2t9meof;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.14.45,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rq/8elFt29dThGAXwFAEl5ofq4Zpvg+PDTESNKeTRmexcZ95xaYqKKbdy1s2f7LTmj6Fdbj+o0V3Y1ZadaN2p3+tinMRWVoXTU0GkvT3mp9m1CVWBKxbE81luoJvUptMkZ3epL36WmMMDdOU+p6+qr/9xKVFZl++4ctXOs1SbZJGkawxGwFluSLL0z042iUePHgGGevAlSof4HfCl5HjVFKy/vqXl+kcDpM1tugFCycJF+WxGqPmzGYlzSDIUKKTsaZFdvUUva3ADCdTKXr4K1oRVKSVnCEykat7YgnrGmAgvLuPWCaUN7yBgMyIR++Y0svUM9eE6bRGq6opEE35pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exDvGk4pj1lyLfVWXR5pt5fojNSpS+OskumztS4I52Q=;
 b=ljMUVVfryJNHOOUMURWrRRs9/x4SLx47F2SGkVHxQ1iMbdwPic/LYCZc83RXkk+/wXbR1kwmqSPQxaAlJvArT2b7IAJ9Q8ZsVhcB8duElWVWIWrqv8s0T1kH+QcybjDFO+nXyVSdsovEt5l+7a77tLb7Z3qKNqZEQ1egy6JbzvTKIHDMkoRihd8f58+ahPiBITlQ5dn4KB2QXxU4QoEDp35Ej8f62K+SMYK0mGJGdzMePydiZNn8DVKqOTMb3WZiXu7zfNzhMFQI2KOkWd+cnqSja3E9ORYdemMHYr0FiL1bc/b1fscnLsINHOK87ywPlpiP5kdxQ9zLjuxrUhS/aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=exDvGk4pj1lyLfVWXR5pt5fojNSpS+OskumztS4I52Q=;
 b=k2t9meofuqq98dDlaDOHr5MtFvVPelVTPuw0iY0fXQxfTb8flUTK2B+s5sun+UVrEUO3NveRUib7JwBBxU7iimGQQkpDpNiyDWklw06t0mmQNi3PG2eErNE0TGZENb5mUQ8PlIraVZNScxmBXd5zrhaR08ejM6LgFrV3WkwoTho=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by VI1PR0402MB2783.eurprd04.prod.outlook.com (2603:10a6:800:ae::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 27 Apr
 2022 11:38:56 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e448:c9d3:fa5b:2979]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e448:c9d3:fa5b:2979%4]) with mapi id 15.20.5186.014; Wed, 27 Apr 2022
 11:38:55 +0000
Message-ID: <683a9036-f436-66fc-f093-57234546844a@theobroma-systems.com>
Date: Wed, 27 Apr 2022 13:38:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [docs] Sstate cache for version 4.0.999?
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Michael Opdenacker <michael.opdenacker@bootlin.com>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <6c3311c1-801b-b17a-44a1-ca76017e9e94@bootlin.com>
 <5e8a23044f0a0284fb12e6dde5a37331160c4b6a.camel@linuxfoundation.org>
 <d6938cec-65a0-b2de-619d-a21bbf1d7bd5@bootlin.com>
 <7fd8456b6a72c1990a0f1008d88335276de5d808.camel@linuxfoundation.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: 
 <7fd8456b6a72c1990a0f1008d88335276de5d808.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::21) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1aa3c6f0-eb9b-4fea-3e7f-08da28428109
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2783:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR0402MB2783A0F840A00B5AB75382C3C2FA9@VI1PR0402MB2783.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cORuUAVqAuw+p7+Y2ioa4/nshjLqlyey9n9dXT6FuDTspuX3BGYfcIecxFzb1nK694/Mkywe9b1ea1GmiKhv4FvhP1QS8zRdKE34WUHrF5z1k93QmY30M0sl0Mdqq8bDggzOIEzWzZpnWoNGr7o3gtYCJ5y59Q9gl3bcF4TFKAIfydJlmfbIBFvq04G9op6ydKAEfRJBAd9IQLqejIo3R1RoFI/5Nftmmh+WgMpLTaolt99hje4VJWlYZbcCGaaoMsfrXVnrs/C+eAlOklkGm7L0fr+oyz3rKoO/cqL2PYxx1WzfmRh+UweZzwoG9xKcXMlVMqI83XfTexIVx+iE0/eq2oF/Zbu3WXKNYStfC/1BwVM/T+hGjpVQU5Su8ckbx5ai8n8mdrOcGfmfni2BV4X+TgYQ2f2W1i2dGR4FQ1tgwKkXwIhlt6gha4Xy/yZ2Al3emx7TRdcY7UwvSKVAKUmwOlf2DMokqPsCA7KwIqxGPVNTaUsNMUfaLm+YUP3WGIpTeYNZKRjUIcspVqPlEoyBk6HyjWFV+MEqY046LXHNU/SyuqJhUIiiHBdANJTKu7xM/kq0R/Wy4pkpxzUOH6aAEKUYELO28h1XXolLVgMLFtxZ+hyYh2hc3RJ7l/dZiSZ9hpgX5E8NE6MSVTfZbI/0fLPhQq+fMSGGEPKDZO9FfFi3ZyBORBg4dXFSQszGzpLjyFSSEZ4jhqEg9Et7WnH2yAMVcIx8SlPc83mlAlok/19Qh6ubV6iyPbt7gi5HF97ryQGGZ9dULWvZ5GtMSo2rYPEY7LFesJTJZJCb3U7bB8kxA2eJGEZYKECeWvns
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(2616005)(86362001)(83380400001)(38100700002)(31696002)(316002)(36756003)(5660300002)(110136005)(8936002)(44832011)(8676002)(66476007)(66946007)(66556008)(2906002)(6506007)(508600001)(26005)(31686004)(6512007)(53546011)(6666004)(966005)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WmxSQ29TREUyN3hUekNYcHJMUVJHdkxvVndISFJBeHg0dkNmL1JzRmUyd3hn?=
 =?utf-8?B?emd2dDFYT2tMS1Rmbm5xSnlIdUQ5dDRILzlubEZtL1lBeE5aRldTaVp4aWpv?=
 =?utf-8?B?UGFvNWhMM09hckNraUJ6QmgreGNGRFdLWjJ3bWcrY0IyU3dQbG5ZZXByYis5?=
 =?utf-8?B?Q2lQYmYvbFJPL0l1bEVINDIyU0VOQzFnL2h4bzdqb3VDdzZxME9DdU5FQjh0?=
 =?utf-8?B?TUJ6eDg1ejBxVGYvMjV1ckc2WndSdUFUOFZvNEJiREkzNnRLWEYwOWtVZDhq?=
 =?utf-8?B?VU0rSXVGREM2ei83RjhFdkVsTjlsZE82V00ydmlmb1J2RFR3MGpyRnJOblVt?=
 =?utf-8?B?YUgwN1kzNmxBT3lEU3pqdnNQVnRxSThNcXd3U1pzby81cmQwelVjQ29jcGtM?=
 =?utf-8?B?Wkd6V0JneHorYzE2dmVqMGV1ejZzSjNJeEhuVU9KSkQ3SW9UNWpibm0zcEYz?=
 =?utf-8?B?WHNUS3liSFdhdnJuTE5YV3dSd29iYWUrbk1ScFhwN2RZdWgzMlRiVUdjQStY?=
 =?utf-8?B?SVQ2cSs1Y29YYnZyNytVNjdHRXZJaHREU0w0SHIrMlJBZldQWkRNQmpNRmVZ?=
 =?utf-8?B?d0F2bWJIYzltVGV6Zzdndjg0YWZSWXJDdWUxUnExYm01eUFDWTBRVXVDOGZ2?=
 =?utf-8?B?NlVDZXJ1R2ZCOXJHOXYxVnZTSXBlV3MybUVnZEVVMDBXcFY4bkRyZ2VxK2dY?=
 =?utf-8?B?d2xkK24vZmV1Mk05TEg2SHhaUlJZSFlpc1oxanhvVXJjcVAzNHZRRXM4enV2?=
 =?utf-8?B?SVhDdG84UUNhZSt2RVlOM1VteHZjVnpyVXMzREI3QzFLRHpNTmxIQ3M3OTRJ?=
 =?utf-8?B?NXJJOUxoZElBZUJ5WS9qM0pNa0RMUit4eE54ZVR2cWtCVTFnMm9WVXp1dUJm?=
 =?utf-8?B?SU9RT0ZhUmF5dWJkb1Bpckp3MVVTd09zN3RtQmpXa3oyZTkzcFZFeE8yRkZ5?=
 =?utf-8?B?N0dGdHBwTlQvKzJYNG9SWi9qUHFIaDJIOW1YK1cxemk5MDd2enRvK2REWnlY?=
 =?utf-8?B?K2hubi9GSDFsZXozUVgyYm1Ja2pNR1o1YmdwQVhTalVRSDNkYUpxQXY3NVAz?=
 =?utf-8?B?V3RpWXNvOERSdDNtLzRSdlo4cHBFd1lYTmlwZUNLOUJxNFdIR0d0bjVlMUU0?=
 =?utf-8?B?ODhuQVdtS2JIVy9IREJYbmhPVGxPQml6REJlVlh2UXhCK2tlV3RHSjRGcys0?=
 =?utf-8?B?VjNpTjZ4Q0xBU3YwaktWd1grdzRJa3pCbFl1TVdRTUVWUkEwaUhTSWRvQm43?=
 =?utf-8?B?enA2d28zR0o5ZVB2aHhydlpWTGIyTExSMFB6MXlReEUzWDFaenp3b29wbGNm?=
 =?utf-8?B?Yy9kRjJpVzRHeWlyMml4dFVXTkg3bk1WUlNiMHpmaDZpaXk5cWx0VUdDZ2lI?=
 =?utf-8?B?RDQxUFg3QVgwSXEvbmYzZnY5d1QyVDUxU0lZazF6bWwxMlZxUjZWU0l4Z3Fq?=
 =?utf-8?B?MU95YnlTM2Vtdnc3b0NDNnJ4M0UwMWwvRVk2ajhKZUJNdGlqbnhXQWVPRTBV?=
 =?utf-8?B?YUt1RWJZTmxJeEdBY2JTL3NnNnBTc1ZYaWl0RE1tQ2s2bWJtTEVnU0daVnl2?=
 =?utf-8?B?T2VxTVJGTXp2aFd6KzdHQUJRamIwSFlkRTRjUjJ6VGJDVWlVMmVmUWZuczFT?=
 =?utf-8?B?UHgwYVpEWktRMTVwcWt2RERvaFVuMHloMXkwWk81OG5kcXlvQXJqUlFGeWQ4?=
 =?utf-8?B?bGNsTXlST3lHbjNweGI3cTlBWUhvRUtCZFZ6VldCQ25BWUZyaVJJdmZEMkhx?=
 =?utf-8?B?VG5aakR6VE82blB2VWhCbXhJL2VhQ2lKSnJqZjB3Tko0bkJnTHRjWVVNMzZT?=
 =?utf-8?B?ejdzOTlMdG0wdHI4enZSZ05ibXZBVE92dUJjQWttMkkzTEx5Q3lGQ01SaVcv?=
 =?utf-8?B?cjdubUtQWUtaUWV3MW11bldCNDZHNnArU1krRlRsR0xuaW5ReG00aG0vYXdt?=
 =?utf-8?B?TkdzZHZ5NGg5cVJ0SHpWREVUd05XRW5FbmtMUjFNaXU1TkV6Wnk2MkZkZVhC?=
 =?utf-8?B?MTYrOXJqTmtEaXhHRm1pRmd1MjdGVmV3emFxUk9kek1XTFJnZitOZ2ZxeHBr?=
 =?utf-8?B?YUZQOStVYlErTkhCOW5HUnlKd21ZMWp5SURjSXJ1cFNXN2psSml4TGQ3UUdU?=
 =?utf-8?B?eFRMcGpKMzJnWGViWHM3VHBMQTlja1N1dnYrSVhmUFJBMFNSckl0eFpoZmxT?=
 =?utf-8?B?T2lRYjR0TzJyNDFTVCtKajVBK25HZHBDakV0MjZrVzdFZDF0YmJPUzVTbVVq?=
 =?utf-8?B?RnNFQmZRd1pRODVaRC9pa1A1d0E0cUhsM2xOdmVmdFRwSVJlV0VvdWlvYVQz?=
 =?utf-8?B?U0wybXBHbCsvMlRHdzJSYlo2dkJjMXp0ODV0bTRCRk1pekJ5S3YrWVJGdFQx?=
 =?utf-8?Q?bU8b4Yrmemzy6Y53dpVliWrF9WWyZpGEGMVl/?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1aa3c6f0-eb9b-4fea-3e7f-08da28428109
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 11:38:55.2926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RyjTUiBdnvAFxTlrCs42XdIZ5NoPhZ+C1k/xjsuITpOotamd+NV5xySLgfrSSEEB9w6/A0pAkfrpsKlQcjTUvogQF6t38qCzwJU4BPOuBTwmGHqmSyuNZyVjosNrqNXV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2783
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Apr 2022 11:39:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2885

Hi all,

On 4/27/22 12:24, Richard Purdie wrote:
> On Wed, 2022-04-27 at 12:23 +0200, Michael Opdenacker wrote:
>> Hi Richard,
>>
>> On 4/27/22 12:07, Richard Purdie wrote:
>>> On Wed, 2022-04-27 at 11:34 +0200, Michael Opdenacker via lists.yoctoproject.org
>>> wrote:
>>>> Greetings,
>>>>
>>>> In https://urldefense.proofpoint.com/v2/url?u=https-3A__docs.yoctoproject.org_brief-2Dyoctoprojectqs_index.html&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=MjQeHR9DHOQsVFvva-_ZotfsR7POIz1TJygkVPGsEn2-goaA86V8vUdPTZ332Qpa&s=CODaCOFarKzmVKW6oZ6KXyqtBSKtrUnzsHftrVzOvuo&e= , we
>>>> suggest to use:
>>>>
>>>> SSTATE_MIRRORS ?= "file://.* https://urldefense.proofpoint.com/v2/url?u=https-3A__sstate.yoctoproject.org_4.0.999_PATH-3Bdownloadfilename-3DPATH&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=MjQeHR9DHOQsVFvva-_ZotfsR7POIz1TJygkVPGsEn2-goaA86V8vUdPTZ332Qpa&s=l8IYvM7AWJwXbzc2csFiERnsApA-RPSvBI9onBSHdXU&e= "
>>>>
>>>> However, https://urldefense.proofpoint.com/v2/url?u=https-3A__sstate.yoctoproject.org_4.0.999_&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=MjQeHR9DHOQsVFvva-_ZotfsR7POIz1TJygkVPGsEn2-goaA86V8vUdPTZ332Qpa&s=OJMppY4I4Tdj_tKNPvS5Tzq52W-bscW1iuxv4y3hpfc&e=  doesn't seem to exist.
>>>> Could we create it?
>>> It needs to be 4.0 for all releases in the kirkstone series.
>>

Mmm.. we do have 3.1.x directories on sstate.yoctoproject.org so I 
assume we should just point to the latest tag (3.1.15, 4.0 until 4.0.1 
is released) of a given series instead of the original tag (3.1, 4.0).

>>
>> Unfortunately, I see no variable in poky.yaml.in for this. Could we have
>> something like a "DISTRO_SERIES" variable which would be "DISTRO" but
>> without the point release number?
> 
> Or a specific PUBLIC_SSTATE_VERSION variable or similar?
> 

I think we actually should have DISTRO set to the latest tag available 
in the series and not have the YOCTO_DOC_VERSION used in sphinx files 
(it's necessary for conf.py though).

What do you think?

Cheers,
Quentin

