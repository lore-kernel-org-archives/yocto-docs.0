Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 612F0D0D165
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 18:34:48 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13345.1767810881575379662
 for <docs@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 10:34:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=NhGkxJy9;
 spf=pass (domain: cherry.de, ip: 52.101.72.40, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w/GaZSSZ9C2BAytQ0GRa9VIimO3XIagI0l0kTuJArOAnFWJNtPF1aMPWh0Ib0y50USmpVVicVPgmx8lFzEyZqU9EnK4F4VYDWbS4t/cegGaeQz2BoG9DUVor2M/XdjgvT3yLAMyGfmrdr/wLHeizE5adgoKLW73SYW7VkK2Yn33UFg6gy011HEdmPke8SjSwAIwZ10rEFwgy8gpub+WqihVT8kdqGTHyWZJZY+AkZJhj51VaKgyljShjWxxmVkHwzuhIAPKWVtLOIbr0qkrPklwUSm6urz29VE35WCdsnh7g4W5D690/AzPb4AZ/gZUSYOEkjYwdg5Jiy3H+sv5Gzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5akd8jn3eFkA1YdgLr2WQHBuO/HFL6VKjX7Rwtd7wVU=;
 b=aKH4li9LXnUXSiWf4secFdbNSnzLReK8KntrOe+3BuT/txSmylFvhlT/WF1FP2oNRko0zfEsyePoCXJMoeUjB+vXRdBO5ay4MWwFz9WgSHIDepugzA6wjemk/YJ1Tr75lBDvhVRFhs5v0uMGGynZpsYNAGgGNdrHHj6pLjgBOrWp0reMN5eUucWtKiFQxTGxB2gJlZnQqnRoOURxPYHwPg9zaWOrhyMLOkmpoA5mPTB7ca1xDfApijQ5jiiTCNYukh3/Z8cKHT+SatVgjCX+W4qDTheBngPLgmyXP+0WeI3yfaL3keqKfKUTBJ6gCsPl6ysIee/EpHmRVfH7Q1gRpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5akd8jn3eFkA1YdgLr2WQHBuO/HFL6VKjX7Rwtd7wVU=;
 b=NhGkxJy9+Bfc4cXdxtPnVuTRb8VevghlaliEFzesaS9qqUvXVX/q/T00n+OoD5pbWMbBo5fGzg1Al02cQWxRLFKfjeZRtlEYSkUPmv7MCtO3y2l1ZwADIwC8dcW4o9+o+MPx0Tc5jzLOPInVIVAMY89MGoGM23jZiDfLzNRQlno=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA1PR04MB10527.eurprd04.prod.outlook.com (2603:10a6:102:442::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 18:34:37 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 18:34:37 +0000
Message-ID: <236c2bac-d0e1-41fc-a0c9-2fb62d938a5c@cherry.de>
Date: Wed, 7 Jan 2026 19:34:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] questions about documenting conditional syntax (overrides)
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <a4d00d27-a3e5-4cf5-e9ef-22c52c1c2b39@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <a4d00d27-a3e5-4cf5-e9ef-22c52c1c2b39@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0313.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::7) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA1PR04MB10527:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b3e4eb3-3933-4e78-b905-08de4e1b6925
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bllldGdsV1o3cDlJTjlMR054ZmEvUFFsUlhLaTZ6clRlVmhXMUs3azNCNEVI?=
 =?utf-8?B?TUlRNUZlNUVvQnpBM2VBMjlwRXZxWlFiSlB3QUJUV2tBUFpOYzRsSEg3RmJU?=
 =?utf-8?B?d1VMdzNSNTFNMzdyc05TcWh2UUxsclB4YTlIOXNzeGMxUlhDeWNkVHA1a3JP?=
 =?utf-8?B?VzNncW5VK285RDRXVXptZHJoTVExOXJNOFZmU3o0RFZWc2hLNE5PblRHdzgx?=
 =?utf-8?B?WXlKUVNGT0N0UEplaWpET0ZqYkVYMkJ1TXMzWjlzOSt4Uy9YR0lldmRVMXlX?=
 =?utf-8?B?YS9EZXJzOGlDY0dJdWNpMlJ3MVRiYlI5dlFsUHRKS3NzVW56bDFHaHk5V2Rm?=
 =?utf-8?B?c1FmeXNEMy9oQXg1dkhUdml1SEYwUTYyUi9PSE5qVS84ajZJTStHOTBHL3dE?=
 =?utf-8?B?SFRac0M1VWd1SnBCVWx0bzFaMDlkMCtPdExDUnhVSmRjTkFWV2psQTN6YVVM?=
 =?utf-8?B?ZGVBeGw2R2MyMXpVR2pwZ0JlYlJFOWdnMi9SMDVVZWpsUFBmM0xPR1dDOURv?=
 =?utf-8?B?WHovNjFuUnJyYzhpbldPVXFZOEdFYW9OUkNlRmxGYnN0RUJEejI3U3ltV1ZP?=
 =?utf-8?B?SkVnT09uUUhnOXFlQmZCSGg2OHZ1d1JoSHByMGVkbEw5bEROMzZGS3F2TERW?=
 =?utf-8?B?dXRtMnNEcU0wS0NvZTdFbmhzL21ZbFdZWWRNT0FKZ05vSEJ2ZFJKT0pyTkdD?=
 =?utf-8?B?UExsTjNZazJiaC9YVWZDTWk1aWR6VzRRSFA4QmR5WE5teWRPVmh0ZTdMZmx5?=
 =?utf-8?B?YXZ4SGtrTjk3ZWNxUG1NNmNqMm9YWkxOL0labFNaT1o3ZE1KK3ZpdEpQbVdS?=
 =?utf-8?B?anNZZkpNT1V3Q0szeERTRTE3K0UrcmE1NzE2VjloZzdRcEFCOGhBM2U3dXBj?=
 =?utf-8?B?WVlqWGNlazNGbDBOWlMvOFJUbXB1N2tKYXlHMzI4cnZCdTU0L2hMUUFwYy9L?=
 =?utf-8?B?N1VCL2EyVWMyOUQyRzVmd2ZvL2RkejhQRlNFc2FFbVc4eXZySFgrMGU1KzRl?=
 =?utf-8?B?a0wyZ3VPb0M0eTJUYldZN2tLTFR0b2xDc0w5YWFsbnowalVTZkw5MzJaOW4z?=
 =?utf-8?B?MEhNWDFaTzZmTGRRKzZnQk1LL0JOUG14UmdtRElDQ1h2cW5lejA5bFl4Y0s5?=
 =?utf-8?B?NXFSYmw2Vlo4c3FnQ1RFNDRtQU5naWxPeEI0dmRaRHBYSU5sMFdrNVFwYmpC?=
 =?utf-8?B?azRhTGpQeGViVDQxMlZiWkV6MVdMRlJCcUovdFJLQmIxQlBERnY5MWxVdDh0?=
 =?utf-8?B?Vk55N1Q5a2ptcDloY1ExcEZKOE1Ua3JLY05tanRIZ3hDLzU1bEQyZVVNdUQ4?=
 =?utf-8?B?ZzhRWHpTQnlYSzlTWW9hM2wvTHJndklJeTJwaU1ZZWVhVG9tY0QvMXJDMzZ1?=
 =?utf-8?B?d3pqVU5SS1ZyYml3SnZzeWhjZDZTalgyR29QUkxKMHRGS2NBSVNDZW1NT2pT?=
 =?utf-8?B?ZzBTNUN0dUZKaTQyNkY0L0FBbjVpUWxGSEpoeC81dkYzalI2Vmt4cEJUZk1m?=
 =?utf-8?B?SmFnZzNJMjd4RzRmYkJFWEwvVk5uT2lVNndBNUtYL3hoR0U1ZG1UcmxTZy9N?=
 =?utf-8?B?QmhoUkNSR0I4ZmI0KzZsdk0rSUl4ZjVDaFJKNGo1Y2YwL2lVeURneWt4TWVK?=
 =?utf-8?B?bWRpUExzUHEzeXpjZmRYMlM3Y3d2c2JNNnh0REJ5Y2czZXNva3UrcXZiRnBJ?=
 =?utf-8?B?c3BTYTVWczJZT254VUxyZXJkOGZqOUNDL216dnBlNjl2ZnBwUkZ6WnhqcUpj?=
 =?utf-8?B?d0YrbWhZTjFjMWRORXEwZ2JFYTlyUXpFN1VoN3V0Y0YyVGNpcFVOd3pudEdp?=
 =?utf-8?B?NHViMldsejhWRzFndGVmenhQcUdCaS9NWjNwN09GRkw5RURJOFVwYUNEOENh?=
 =?utf-8?B?V2tIMGNzWnFZYmxzcmg2djJlSnlyVXphL3pIc2Qwc1p1RlE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RTZZVy9HT1V0RDEzV0ZoS013RjM3TmcrcHk2dzg2V2Q4QlFySXJIRm0vRDcz?=
 =?utf-8?B?cnRTYkxIclpBT2JNbmlvK01IUFdkeEZ0VUwzSzRyL2VPS1cwemZHRGcyUFBr?=
 =?utf-8?B?ZWJmY0h1RUJyVHVYa0diMHFvcnYzRjJoOTdGaWFSUkRpKzB3WHpTR2FvRWRH?=
 =?utf-8?B?R0Z2QzhZU3dFS2ZNZmRjdklwNEpPOFljYVpGRkRCOFYwd3pTWEZDRUYzZzMw?=
 =?utf-8?B?QlRYVDRvOHV1d0VyQmhqL3dGL3ZFV1dQSjhNUXI0TytsZCtGSHl6L250Ykgv?=
 =?utf-8?B?eDF1WFFNNUFLVVNmK2gvdTFER1Q5R2U2QjZacXVvMStKMVgzYTBIVjI4R0JF?=
 =?utf-8?B?SElnU3RTTWJoQUlJaW9IL29lcGFlTWRuSFNUaDhKNjFBNXZpcGplc1poRExD?=
 =?utf-8?B?OVNjZGxPMTBkV0xWdjAvWkhGMWR6MUkrTWcvNDhEK1o4cVUrNmZSNWZaTXRj?=
 =?utf-8?B?dHF0YVByVFhZT284REVSc1pNL3AwWTJFbWkyTGhPUmwvT0xGUndybUhGWGtj?=
 =?utf-8?B?T0p1RDRtL0NlOHVFSm5acFVnSHdybXk1aDlNWkVuZHVyNEszQk9taVV0OW9y?=
 =?utf-8?B?L1AzUGdqdzZsT1NIeTBaa0RvWjVRNlUrQy9kWk1qQzB1NU85RGROSUI1VFc3?=
 =?utf-8?B?OGtaVzJBd3dXc21NWGVRSmhEclYzemxKamdCQk9hSStERGlpM3lVUWtYWDVI?=
 =?utf-8?B?WGxhamZrd3RSakNBMDloZXlnMmcySk9pQ1lDc1pFdTN6K1JyWlVQaGhVcWFI?=
 =?utf-8?B?cUNZV0N1YzVHZ08rKzJwUFVyQXNXTnVvd1MzbGcrL2VpVEplalFwZTA4SzRH?=
 =?utf-8?B?a1o0Q3p1NXNrV2haVlFESTF5dW1KVkxNQnNQZkRtSnNIemREUk10a0ZQY2w1?=
 =?utf-8?B?Z2ZWTG15TGUzZnBxeXBhYVYwd2RHSENNaGpwZVJCaGtlemtyeVhrUWNBaW9h?=
 =?utf-8?B?dHBaL1c0R1hYdlFLd3FGL25LUFRwV1lLREtLNlhldEZad2VZY0RxTmkydWQ4?=
 =?utf-8?B?Y2I5bHdLT0lRZ0VFT2VyYU1sUEgzWkp5SjltTUErTlhsSERuRHF4WUVySStQ?=
 =?utf-8?B?Ty93a3kvemdRaDJoaUdhcy9yM2NZR3JVL1lFcG1CZGQrcUlUeTllZE93bUJr?=
 =?utf-8?B?dFNkaUl5UzFOallKYU83TzNjbWhwcUdDd3ZWVXp1VWkrQTlzKzNzTEdHR1FC?=
 =?utf-8?B?TjVVS0JLNVk4YVU2M012OGdQR2RqSUt1eFRCd09rNlRMSTB2ZGg4dUJTeE4v?=
 =?utf-8?B?bkQ5RnVPdi9FU083LzZWcURRYk4zK05NcTRPY2ptTFB4emRUd21ici9hdlhO?=
 =?utf-8?B?T1BiU1dzTTl2OCtHeGlwdndzajNuOFJseXNuc2Z0aHpMRTVFNS90UXd5eVdC?=
 =?utf-8?B?alo4QXh5MHQ5Yko2dlhWbGQrUzk0N2c5cGxuZkFEckRXQ0VsREJpOS9KNlUw?=
 =?utf-8?B?dVhzNzM5TnFDV2JQNGhSWTVMUU5odStTQVZCdUkxa1BaRXhCbWVKUlRqMGpm?=
 =?utf-8?B?ZnNLUWN6K1ZISnVMK0lpTUw1dzFNTEZ4WHJOeXc0OGlvb0lwSkZOTHNDQjRN?=
 =?utf-8?B?aGprcFM4VXEyQ3R5QXgzUUdTR1RBcmNia2pKSmZXRWI1WU5MVGJQQW5rT3Fi?=
 =?utf-8?B?VWZ5RjdIRGRNbmNrbEVsMStzL1F5QllTZDlvT0svK3F2ZGorTEtZUWJCZkI5?=
 =?utf-8?B?OWRSays2TWNZZFJoeXM2MGNmcHZoL2JVWU9idWFHRmxYK1I0TWpsMHQvTlIx?=
 =?utf-8?B?WDhPUFRBNndWSDRHai9YcWczSE5jS0pRdU45MzJLc0Nrbm85dXBiVFplUU1z?=
 =?utf-8?B?Q1Zjay9XQ1hNbmNNVWQ5ZGlJWEJSNHllRjRpbTQzUjk1ZERoMjVxSmUzSDVz?=
 =?utf-8?B?ZktKeVFqeG5wVytHdXQyUGUvL2YzZnVFVXVRbjdtSUhoOHYrV2g4TVdrL3p2?=
 =?utf-8?B?cHpTQkJtLzRjakY1UEQ1NnJ1QUE0MUZVcW5zN3B5b3RqYjBqdVVCcWJoZmFM?=
 =?utf-8?B?OENFd1FSRlNXUmwzQlRBbWk0MGg0V0wrWUxVWFoyOHo4ajI3ZTR5bVp4UGp4?=
 =?utf-8?B?K09adDBSMmNHK0hoUDR3a0xYRnhvRzRnNHNCOFlVWGNOMVBQcVJOYUtsMUV2?=
 =?utf-8?B?MjJhYTNhbzJYN1ZWWVh0RWhETHV1RklNanhLN1RZUDJtdkJlQU12b2tQSGx5?=
 =?utf-8?B?YVVQdjlZVzJyRTVwMnFhOW9YVmFtdWlKOWV5NzJ0WTV2dHBMTm10N3J4ZUlR?=
 =?utf-8?B?eGV4YUVra2EySUVFMGVWSEEzRmlJNDl4Y0tTSnhFcjl0Ly9HT3RGVm0zZ3F1?=
 =?utf-8?B?NStubFNyNExhVk5INGhweUs0ak9QVzJHWW9hZjd1aGNSMHpFN2JnQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b3e4eb3-3933-4e78-b905-08de4e1b6925
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 18:34:36.9210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oVSFdjEDuHGVxvT6KzhFQR1k9pVDGXnBjRRNLunBT71UhEgr3ESEF/u2BayDNJw11m5PItL/L/kVq9sNCCVnkihhaZZWf0QYia3uxIN/XSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10527
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 07 Jan 2026 18:34:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8416

Hi Robert,

On 1/7/26 7:15 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    i've never been crazy about how overrides are explained here:
> 
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html#conditional-syntax-overrides
> 
> but it seems that there are advanced usages of overrides that are not
> mentioned.
> 
>    first, there doesn't seem to be any mention of using multiple
> overrides; here's a sample snippet from meta-oe's rsyslog recipe:
> 
>    # Disable for powerpc64 with musl
>    VALGRIND:libc-musl:powerpc64 = ''
>    VALGRIND:libc-musl:powerpc64le = ''
> 
> that appears to incorporate two separate overrides. can there be an
> arbitrary number of overrides in an assignment? does order matter?
> 

Pfew. Someone needs to check that, OVERRIDES is *very* complex. It is 
not easy to explain. We need to do something better with it in the docs 
I agree. The same can be said for variable context. Also not an easy topic.

If I remember correctly, if no other OVERRIDES is involved for the same 
variable

VALGRIND:libc-musl:powerpc64
and
VALGRIND:powerpc64:libc-musl

result in the same outcome. Note that :append, :prepend and :remove are 
NOT typical OVERRIDES and replacing e.g. powerpc64 with append in the 
above, results in different behavior in some cases (you usually want 
FOO:append:machine and not FOO:machine:append). We'll omit that for now.

The question is when OVERRIDES A is "weaker" than OVERRIDES B (that is, 
it appears on the left of B in the OVERRIDES variable), what happens for

FOO1:A:B = "bar"
FOO1:A = "foo"

FOO2:A = "foo"
FOO2:A:B = "bar"

FOO3:A:B = "bar"
FOO3:B = "foo"

FOO4:B = "foo"
FOO4:A:B = "bar"

FOO5:B:A = "bar"
FOO5:A = "foo"

FOO6:A = "foo"
FOO6:B:A = "bar"

FOO7:B:A = "bar"
FOO7:B = "foo"

FOO8:B = "foo"
FOO8:B:A = "bar"

A simple bitbake check should help answering that question.

>    an even weirder example is from meta-freescale's gstreamer plugins
> bbappend file:
> 
> # The i.MX8 uses KMS instead of the Vivante specific framebuffer API.
> # The i.MX7 does not have a GPU, except for ULP.
> # This leaves the i.MX6 - with the vendor BSP - as the remaining use case for viv-fb.
> #
> # (Note that viv-fb is about the _windowing system_. Vivante direct texture support
> # does not depend on the viv-fb feature. It used to, but that was actually a bug
> # which was fixed in GStreamer 1.22.5. Since then, the direct texture support is
> # detected by Meson by checking for direct texture symbols like "glTexDirectVIV".)
> PACKAGECONFIG_GL:imxgpu2d:append:mx6-nxp-bsp = " viv-fb"
> PACKAGECONFIG_GL:imxgpu2d:append:mx7-nxp-bsp = " viv-fb"
> 
>    wow ... an append operation between two overrides? pretty sure that
> combination is not covered in the docs. :-)
> 

Yeah... This is a corner case. You basically append to 
PACKAGECONFIG_GL:imxgpu2d only for mx6-nxp-bsp.

If it was up to me, I would set a variable instead to improve readability.

E.g.

PACKAGECONFIG_GL_NXP_BSP = ""
PACKAGECONFIG_GL_NXP_BSP:mx6-nxp-bsp = " viv-fb"
PACKAGECONFIG_GL_NXP_BSP:mx7-nxp-bsp = " viv-fb"

PACKAGECONFIG_GL:imxgpu2d = "kjbgjbrgb ${PACKAGECONFIG_GL_NXP_BSP}"

Cheers,
Quentin

