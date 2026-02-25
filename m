Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01258FD3760
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 14:03:34 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45639.1772028211301383831
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Feb 2026 06:03:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=fc+xJ/mV;
 spf=pass (domain: cherry.de, ip: 52.101.72.56, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UoWfqogTlgGXT4qA7I0wiMSvZqepoTHZ1E5uiozAi5Su8GkSBAdcezwEQ8TF7ILBXLFU/2voX5dniiy4xMG1ZquTocSIbbSB2lwrPcijo11TLbApvYztc5GP7mSZoP/M6QMLdDqoCNtZkbH1AObE0+ewkmIzMeygZBs/Cr/jkcqcXFTseYuLKT72psijLaS6vgiFRD1/mKD4lOcyobub7qCXj8Ta4vl0FhwBy2nNKQ54wyXo79TohropEw7bjEoDRdNUOSzzVbi1vvFdZQMTo6KBcIK2gWjNd1ZSwhlkScjzatzQ+Mo0n7uB8t/PNiVOUP+f8Y/rVpjW9t2teoFt3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4aOll75M5G5gD+1LL8BmiuoTacqo1n7bt34TEULrGcY=;
 b=YF+tPLFE1lTaCZtnchnbHuraWw+ArlSMWpkVL0TxCyKdIMJWUv53I0+sc021+es6cZaNYtWKjAUtwFuipQyXm23e9CVQg2w6XWrxSoWYOpuJ6as+FTVVtad8zMLjt6CWZxBmWz4OcGlo3QXd6SJIgpItkaPD9Ywl+vFjwBIxn61L+Tue1lePya6X761qjdzGAUmkuRrxKE9qVKWIk3cBLciHu1ECKs94iJQ8DE+60nrHvtZMdzDK4ly5RJjsQWXlbtzRmEiiQeDLko90+ANHtuHYGL9ZjkkgR6tbbUO0bjA7AXGHLyyEEFVWJ0TQQBcgiL5dIuXDyoFReamd9yseCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4aOll75M5G5gD+1LL8BmiuoTacqo1n7bt34TEULrGcY=;
 b=fc+xJ/mVzng4S9gT/DjUHboWbLggWc3ZGCZB7rz04J9tYkixdylLOCEB2YMyEuJT3rjmrzSQjyZ28PxS1uIFvSP3lFeXb9cfzjKOwmJZ4mptC5kilVaupInHM3EOEIUudKpy2rl/Vzszps/x2YjgMO1Df+qPaiFYWlbujplL/U4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI2PR04MB11148.eurprd04.prod.outlook.com (2603:10a6:800:293::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 14:03:24 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 14:03:24 +0000
Message-ID: <48e559ac-b449-41eb-8e57-4b4e6a169faf@cherry.de>
Date: Wed, 25 Feb 2026 15:03:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v5 2/4] use a venv for installing packages with pip
To: Antonin Godard <antonin.godard@bootlin.com>, foss@0leil.net,
 docs@lists.yoctoproject.org
References: <20260224-fix-make-multi-target-v5-0-7ebf281618b4@cherry.de>
 <20260224-fix-make-multi-target-v5-2-7ebf281618b4@cherry.de>
 <DGNZH9VNHWMR.16IZNV6J43Y9O@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DGNZH9VNHWMR.16IZNV6J43Y9O@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0188.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::13) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI2PR04MB11148:EE_
X-MS-Office365-Filtering-Correlation-Id: 39e3964e-bf71-423b-a0a6-08de7476a3f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info: 
	i9zKCc7lZ48ccFsmwHIixT1qhutMsa9hM3q40GHeqr7aa6qJkpdjpW34DKUxvbl44EYHyJBEQHE4vHTQXUb55IgguwPhXcKblY1VSY119t0k8c4ED+xhESYxdOjrph1595fUoZcDEHmcK3j/XsIoJoWd+j6ko4gIrlrEsdxrdivi6cBFKwrKo0WNs0JEdrakck7rPDeAMjM4KqtduI8E/SAINi7RBJQL2uJzLYh3o//lBPuvrk/A0vLxHmmgF/uZPXy1UJMalrPxEOSXksp5Pl/TAL/U0Hlf0qPJBFUIGOC86IM9/XUqPce0eb808EUWrHqdFqOwNSJ1Ss/iSUtgJEcs0M6tAIYF/4RozZHukt2PoBxOhwkGL7Jn6tqMwZLGN8NbXnpQYTRkJ22GC3lslZHOvPradX5m5/Mji6eyhWKe8r54a+LTq60NAUzgC7fFlVRLdc93IU1X6BX1cHZIbbfkL/SUwGtOGeur36JO9KcrOJSFPMkqp2XQD+rcFA0U/DNKNjbq67WvNpwNI2emAiYP9mXBJJzVIi1ZRkBP8/WnCuZvMYAhBAgmP4aGtoY34qUF7qrwhKpXhRqITjMf/c+3T67YAWDOtgzOwN+N25HKO9sRh/U/H9GS+Kmhiyaxj0IXH1B6SjZhsAlx9kRmNxiKkTIq+p+6CYSbfh1qZAQidC0gQNXrwEPv3guTbTFcq7Wg8d/KClyhMnphGTGU7Law7NyN62DxTVf0i0K1EWU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VFFVKytqaVdaZ0ltYjNzSUNvUTFqRXRlZGRWZXJpNWo5NVRKdWh6TjE2Qy9y?=
 =?utf-8?B?ZE94UW9zZHVWVE1iNS9nQkRmUzN1STZhOWFpb2VvT0IvbHBHRW03enNyUHN1?=
 =?utf-8?B?YWhFU0RxaEl1emJQTXlYTUt2MW9XK3QvTFB2RWRkT2JnKzNJblhTa1ozcTB4?=
 =?utf-8?B?UmFCcklEMmlUaGU2Z2hKUDZxTXd4MHM2SU9EWmF2L2RmazFiRzUwK3JwN3NK?=
 =?utf-8?B?SHpodmt3T1JTR0NpdlhjZDJRYWZqZk5oWUh1dUFSbjIzOWNFbytDNlo4cTRX?=
 =?utf-8?B?S2hDcEpzRmwyN3hhdExhOVc1L0pNM284MzQvN1VNTnNFS2pSbnlSZk90MG01?=
 =?utf-8?B?SU9QQ0J1UE54VmRSUmVYV0tTbER0TElPWWM4emRnSjNBOWpPb3NiNDEzQk1K?=
 =?utf-8?B?Z0V2U2F1MzQwMmlGSDJ1Zy9VS2ZOT3BscERsZUthc2NOU0ZlSjd5Umt5c3dl?=
 =?utf-8?B?czZGcS9KUktKQ1BUaVVISVBpYjAxQ1luSzdGTGdwcng2R0hEWDY4OXVkZ2pk?=
 =?utf-8?B?YUZobWxmbU83Y1BQUXhWcENweGlzZVhmNnlNcUMxekIwQ0MwYk9ENGhpMi9X?=
 =?utf-8?B?TmNiVFBQS2hOMHBTcDFRUXVkVU03R3h5ZGZCYnJMUElLUFpUWmdHdmpCNS80?=
 =?utf-8?B?OE5aVHBnQlBlMU40aUtZZEZxMGt3TkdwWmtndHNINmNFOThQcVV1dEhFNVYx?=
 =?utf-8?B?NHgyYytJTm1iYXlSM2twVWNvMUpQQ2J1eGtBbSt3YmFGYzU2R3dGZnA1YWRr?=
 =?utf-8?B?SkRwYjdVTkdibmRCNDFBZGg3WVl0SXRIZ3RwWHM2OTVZM1Zjcjl0UUJCVjYx?=
 =?utf-8?B?eGlVYU5mTUx3QVFJczZOUEV4Rm01eXU5WHRLUWxJK0c0NDJzWCtmd0JTTUVx?=
 =?utf-8?B?UEJSY0ZQWW94MFpPeGx0MDI2QU1jdkxVUldxUkV3ejhqWUdXTVF4Zk1ycUtk?=
 =?utf-8?B?TDVBYWNVeW1ldWQ0WkJBVy9GdTNMaFRsK1BKM251Y1BQWE5mQkMza3laemVs?=
 =?utf-8?B?MW52ZGRkdXdMYWEydXFiVEJKWlRZTHhRcmx2MVZ4aFJKSC9PcTgwQ2doNExt?=
 =?utf-8?B?Y0RXMGRPWHNUc0taN1lJYXhIWlRiVlNoUEwwd3NSWE1VRldhOXhlR1lsRGE5?=
 =?utf-8?B?bVZSSFc4SU1ncEF2b3VqQ3FGM3UxTEdGRHdnM2xMc1oxVDRIRHpkanBnTFZv?=
 =?utf-8?B?TEtPRW5iWmk2T2M5Z0pmNkxTTDk5NDJ4dE9FbytkY2psT0xtNlZUelQ4Q0RQ?=
 =?utf-8?B?NWQwVFdBODZvYlJKcDc1QzZ3UVZHd1B3NWgxV1VsV2NvS1VoSXBmVmxCNWxS?=
 =?utf-8?B?WmdZUTZNYUZDQ0UzdFV0NENwVGlKMlpUeXlXb0o5MVlMQU54NVZJdUhHdnF1?=
 =?utf-8?B?Qnd2Zk5pOHI1bStoNjN0NVlWMUtWSmtOQXVIQzMwd2FyUnJkZFlHbytuS0Iy?=
 =?utf-8?B?WTg5R09Qd3RqY3Rjbk1ncDMyZVhmcFllbGFJenpWeHE2RG5TYnJqR1dqbENF?=
 =?utf-8?B?eWR2bng3NHBWcGdFWmFlWTVNZnFJemdja1JRUmp0RCtSSHlscURzdE41Smw4?=
 =?utf-8?B?UVVocC9OeC93UXB6bjloT20yeElrUzZjUlZnTTRuVWJTdkJRT1BUTmtQTU9O?=
 =?utf-8?B?SFJQME55MkpzRkRWaUxzekN6RmcwR0w4R1JFdmtpUHA2VCtKeWlvN0lWa2x2?=
 =?utf-8?B?N2RTWG9EZGRQVHg5MGNjcm9tM29IaXNzbEhkT2xBMFVMZkFnZXlkSWdONjli?=
 =?utf-8?B?VHczdzhBTUhXZUNxa2VsaVlocE9GYXYrL0hFWnp1dkZFZ2VPQmlWNUdDdzZl?=
 =?utf-8?B?aVM2d2tnaGVVNWF3S2xZZHlZZzg0QmNrMkZvamE3NUNPVGllOEl2WVE0am5q?=
 =?utf-8?B?cFR2MWVZNmgxN2hZeDFTck80VkYvc3NSRGxrNDNhSEVENTRpaW9KRUpNMmhM?=
 =?utf-8?B?eDZuZFB1M2piVUZSTnpTVWJoRVJCK25hMXVUQUdKS0lQdWI3OExFcHVJellM?=
 =?utf-8?B?d0p1ZXpiR2Z4bUNmQzZYOEQ0M0QzL09WMGVtTEpRSktXU0lWRU5DRGhTdXdx?=
 =?utf-8?B?QzRkY3NLVXM2Zi90eURWOGhUcXF0R1JLbnZUN2xCODBNdldtR0dQRFJETlU3?=
 =?utf-8?B?and5YzJxekF5VnNXSFQ4dGVmQkhiRVpjSFkyUnNlRWFQcHFubFB3cXp5OEtw?=
 =?utf-8?B?b24rSHNabmFxZGxoVVRSOHNJSGNBazhCOUtCYi9kRHQ0VTBrRHI0MzNQb2pS?=
 =?utf-8?B?NnRsWGs2N3llS3lDeUppNFA2aFF4K200ZHd6NW91b0ZxM3hvaGh3VXk1Wk1q?=
 =?utf-8?B?cVFHUWpMVmVPK1lxYWxMVVpCZDU1VWhmbVNqeUJZNlhuQkI2NGhDQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e3964e-bf71-423b-a0a6-08de7476a3f2
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 14:03:23.9806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lLcbrjijAuNZrrbb9mCFC4krpj54BUg2qGTWX5PVeTjJaR8aC0eHKVQLmOgjxxsevo/V6Tgq8FvS6zsOTXRy+RUKQwxzUVigIUzb431ReKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11148
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Feb 2026 14:03:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8988

Hi Antonin,

On 2/25/26 11:50 AM, Antonin Godard wrote:
> On Tue Feb 24, 2026 at 5:32 PM CET, Quentin Schulz via lists.yoctoproject.org wrote:
> [...]
>> diff --git a/documentation/tools/containerfiles/Containerfile.dnf b/documentation/tools/containerfiles/Containerfile.dnf
>> index fd47fde34..12d97ef6c 100644
>> --- a/documentation/tools/containerfiles/Containerfile.dnf
>> +++ b/documentation/tools/containerfiles/Containerfile.dnf
>> @@ -1,6 +1,17 @@
>>   ARG ARG_FROM=fedora:40 # default value to avoid warning
>>   FROM $ARG_FROM
>>   
>> +# RUN . ./yocto-docs-venv/bin/activate doesn't work because env variables set
>> +# in RUN don't persist, so set up the virtualenv manually ahead of time.
>> +# Unsetting env variables in Containerfile is difficult, so we hope it works
>> +# fine without doing that for PYTHONHOME (see activate script content).
>> +# Note that the actual location depends on WORKDIR at this layer in the
>> +# container, and it must match the pwd when pip3_docs.sh is run in a later
>> +# layer. This *must* be outside of any mount point otherwise it won't be
>> +# available within the container.
>> +ENV VIRTUAL_ENV=$PWD/yocto-docs-venv
> 
> This produces a warning with docker:
> 
>   1 warning found (use docker --debug to expand):
>   - UndefinedVar: Usage of undefined variable '$PWD' (line 12)
> 

Ugh.

> Can be solved by adding:
> 
> ARG PWD
> > above
> 
> ENV VIRTUAL_ENV=$PWD/yocto-docs-venv
> 
> Are you fine with that? I can add the bit manually if so
> 

Nah, that doesn't seem right. PWD is a special shell variable, we 
shouldn't allow the user to override it via a build-arg.

But that does explain why it's been resolved to / (or rather, the empty 
string and then have /yocto-docs-venv in the env).

I would suggest to set

WORKDIR /
ENV VIRTUAL_ENV=/yocto-docs-venv

instead, plus some comment in the Containerfile explaining the 
restrictions. I'm in meetings til tomorrow and my brain cannot come up 
with a comment right now.

Cheers,
Quentin

