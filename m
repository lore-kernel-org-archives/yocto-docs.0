Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9204E77180
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 11:08:28 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.71])
 by mx.groups.io with SMTP id smtpd.web10.7782.1733828898254838419
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Dec 2024 03:08:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ThpQj1Yr;
 spf=pass (domain: cherry.de, ip: 40.107.104.71, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFN2HUfFD8Wj5bzvToHY5oYPIgqL+X1uu6N6Mx1F7ppe4rJhX2AaZ5Wm4XTDilKIyYTgI//cQHoMA8x87sZkazRSR5Ew+bqae6flKa3GwB/YmrbihjJ1pGuB98+1FdSBzjUQEuYK1DQScHyo52qDvodsiZ64ClJkyz0f4lD6M8tHsS57Wp3JNZdb0e64OG23HIUYPzXTg9w6YOAd3gTvXjhtOVkgDZaBxtycQAkSYSaFi29cNipmq12Uwdd5b4VhAsVXI8bIaEylKHxTcDmf+rad58sCBqYfcwylyqJ0bYV9qke/Ilu1k2TqhoHjzRlfsMq3kDNlLQHIelz6GpXBrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gjUd/6jVu8x/4/0t6QUu3w6K0wvOCt5r5K08ZwNu7RY=;
 b=TijYGF5H/b4YZxAt6zlEYpmBl2ofId/kamMaYpq4ut1ExXP+fkSaK28mbjc5b0ydMrCXIA+lrMeXh+M3ejrULajJIjI4q12ZZ9IvKBDgGEcUnXFwRn2nVeEGNCAcOEXOVvnmCU8fpu5Lp6oC1YBMdhWnftXZTzlD11pNwz3g5g1c0TwDGLs/aYVu7dx9lUZGksF/bWcWvOF/9g1YIJE9ryeRuqq7TXtdwBhN4B3cslFIvIF8PsFFfpB46Mn1/sbzZbCm7SQJ6gMsVJXkdbMKDooR+MNVoXoTN98N8CECXnR2DxFPD1qx6Af+cqofdl7KvIS0cgOIOgJz/OIpT9xa6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjUd/6jVu8x/4/0t6QUu3w6K0wvOCt5r5K08ZwNu7RY=;
 b=ThpQj1YrU/6TvH3p3kwYp705uq23cmP1H3eGztoeodZEQbCtIB50jElgJhP/mEmqyBAabGaFgpZtbjc0UuT6WFhtrpf0XZrG66mfhr6N2W/Qdj2DDjUrYLi+h/LDM/JUQIs4ukq/4VFZ8a/EbpEiHTcx8qnMJer90n+3tWV+zaM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI2PR04MB10145.eurprd04.prod.outlook.com (2603:10a6:800:22c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 11:08:14 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 11:08:14 +0000
Message-ID: <85b846b7-09ec-49dc-b739-813d52dffb81@cherry.de>
Date: Tue, 10 Dec 2024 12:08:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH v2] Add scripts to build the docs in
 containers
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241205-docs-build-dockerfiles-v2-1-047cb3245adf@bootlin.com>
 <fd8bce6e-155f-4c95-8061-bfef0d5784dc@cherry.de>
 <D67YBBAMD627.3JPAXWB92MIQ9@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D67YBBAMD627.3JPAXWB92MIQ9@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: WA2P291CA0004.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::8) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI2PR04MB10145:EE_
X-MS-Office365-Filtering-Correlation-Id: b788cf56-9caf-4a22-83aa-08dd190af0e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?L0UvSHdLUUxxUGtJa1ZsL1gvcElETUJId1B1TTg1Nks1VnVaczJUNG1Fd0da?=
 =?utf-8?B?NDdLc2Z5d0t0WVYvcHl3SklHQVh4K1RXWTVnVGFyd1FRZGQ4a3BRTFV6Mmw0?=
 =?utf-8?B?ZDVUZnFPMXl6RWoraXJuMUtFbHJ1dGNOZWdESFdva2NzSm4wNlE3K3dMNmtB?=
 =?utf-8?B?Uk9jeFRmOXE3ckpQdDFrVHhpUEsvaXhSZDZFMko5VTVoTmpKS2lqVWc3ZkJo?=
 =?utf-8?B?RTIxbWZhVDkzUnpwbmU2bGhEVTdYeS9IYnVLQjBhTVVHRXlNQ21VcFRlQTRK?=
 =?utf-8?B?STBxSHFZbFlXSDZjMlFFbmphbmZmS0ZmSHE4NVBFMjJ1bnJFRnNLcnVDcWxG?=
 =?utf-8?B?cWY1dCtwYkdPM1VrSHVzZXBqM3hHZ1pjVFdYa0h6QjlhUDJOZGxVR1dFS2Ey?=
 =?utf-8?B?RXZZeFpBc1IzUVNkN3VuWHVrUU05NjEvZE8wUGM1Z3Zld0J1aVdBWERRMlBB?=
 =?utf-8?B?T1NTYWY3bmlYU2xpYTdsMW5QSW5SNXJnMnYycnkvTVcxdE4waHBHa2M0N3ox?=
 =?utf-8?B?N0JVc1FQa0w1YysyenRGZW45UEphdXBpTEdtNXZGR3BiRlQwV00vRlR1ekJN?=
 =?utf-8?B?a0pxSURJTzNTYmJwRUp3ZmRLWjd1Qk53d0U4US8xOS8vQzZERmJDb0EwTHIy?=
 =?utf-8?B?czJxQjdhUUIzY1R3ckpldDFwRmJoV09pRldqODBJYjZ4OW0zM2pRV0lFQ3Uy?=
 =?utf-8?B?aTh2QitCQnZ3Y1VxMDVKbTIzUWxwRjhnTnkxWUM2WG5uZkdlYU82WWltbHc0?=
 =?utf-8?B?NHRUbjVhbDViV05wLytDdnRBNlJlWUlXM3d1bmxKWExmSDNoeU5BQmkxUEh6?=
 =?utf-8?B?SHlrbm53N2o3KzBCSWtabTc0S2N4Zm5ja1dPWlRHQkN4dk51NkpSM3NwalVn?=
 =?utf-8?B?c1VkTTZoOW9wRDNodjhncU4yMWxlV0YwRWZzdzR0cjRlbjh3MlNPSlpYMnla?=
 =?utf-8?B?OVRKMFovWEp6THAwK2Vzdmw4SGZHNzB5cEFUaUE2Vi9YUlMwamdUSDN4NVo5?=
 =?utf-8?B?dGVjVGxTU2xKRzNSR21HNGY1QTFRNmdLa25qK3BsOHh0Tm5mVjZ3L2FndjRR?=
 =?utf-8?B?VVlncmd0ZW5FR3JhUkJScXRxWW5YaFpEbFVOQzhnT3MwSlZRV2F5Tmo2YWJk?=
 =?utf-8?B?aWJxWnBRYWlyUk5EcEV2ZC8wRHZzV1NFTWJkMnVLRE5MdVV5Z3JDS2JZZFZV?=
 =?utf-8?B?cnVubHVnNHIxeXpxbEZiNjNKUUNyeW1VRnJLZmcreHA1ZWl3MzlzSFJHcGs1?=
 =?utf-8?B?c01ZRzhtVm5qVFplWEdZRkF0Ukp3bjA4ZnA5d09pYXFiQWdCaE1hSFE0UGRp?=
 =?utf-8?B?ZDRnaHNicjdwa2g0UEU2eUVpTjI3ZE05aFRsVDV3OUhKV0JrbFoybm9VSGdz?=
 =?utf-8?B?c2VvN3N5dEJqOGtIMHNWbGN4YTlySHhHcXRMNkx0aHBXTkJ0eUFLTm5rT285?=
 =?utf-8?B?SGUvWGgranViTlRGMm9Fbmw3b0NUOFBQWFBRaDVYODQyRm1EdWdOVGNnU2ht?=
 =?utf-8?B?NHRqakhtNklSSVNSVWxPUVM5NzlBeGFMazBlQ3Jhem5HMEpGT2o1S3lnUDF6?=
 =?utf-8?B?aVVkd0s3VFV0T01BMktpc3NnTHJqNUx2Q3YxcmFORWJldnhwelZGRm1CS2xa?=
 =?utf-8?B?Um96UUZOVU5LdWI4RlFMeXhDMCsxdlFqUDJyTXpXelNjd0llVjQ1S2VlcHp0?=
 =?utf-8?B?VExBNGtxbmk5QldUVURncHZ1SGVCSW1oN0dPNG5RRHNkKzBSVFFDYXNkSTlB?=
 =?utf-8?B?TUZlUnpiM1ZGTjluVkZCUXBYUUY2WC9sNld0bHExekZNRVM3cEIxOVRkSGlM?=
 =?utf-8?Q?N4Qh/nEVnKF2WNfIII9LvldUJ7QuKRH7u/0rM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aHkvZjdNeko4NlR3RUdOTEswR2lmd0xhMTQrWGE0aTJjSFpLSmg5Vi9vRHcw?=
 =?utf-8?B?U3ZIYVhoYzR0Q0Zzemo0Ti83YmdaUkJsdGtxeUJacWdUK2VNTU8xT3BvL1J4?=
 =?utf-8?B?SkFWT2dQUTVBbkh2Sk5YdGExc3prOHRRVnlLam00U1BqcHRpYmRndHQvOUtu?=
 =?utf-8?B?dzhiZThjU0dLZkRGUmRLc29IL0NPamNLbnhxVGJZbGtJQnlwYVNnWWRRanMw?=
 =?utf-8?B?VXlrUFZLOHR5OTRpVXJsRWtWNmMyVnJid21xQzhtVTdJaEl5M2dJRmJZcXBI?=
 =?utf-8?B?Um4ydWdZb2w3SWRKLzJLQzFiQWVOTVRrVE53cWIxTFdqM2JodFJDcldtQmJL?=
 =?utf-8?B?WFMvOEpNeGpkRnRONjFGVlFMSGF3Rm1WMjhOdHR3Unk3VGloOTJQTlVxREFH?=
 =?utf-8?B?L2N0Q3BwYWZyUjc3SkU4cXBOOGsxTllOcS9STERZVXNIdEF5T0FXT0F3dU9u?=
 =?utf-8?B?MEw0SWtsQ2tEQmRTVi9SK3BJYWlFMzArdGVjMUp2dG04MGk2S0tVUk1rS0di?=
 =?utf-8?B?QkRkR2dFc3I3VWdQVXhYck5jTFhkb1FwVWFqSmNZdVhIbEROYVRJNTBOK0xy?=
 =?utf-8?B?UnFhaDMzamYrWThKQUZHVktJT1R2ZldxRHhrL0tLa3J3NmpUcHd5V1FqcE4x?=
 =?utf-8?B?Sm1oSW13d1JidlUvdnJ1TEtDTTFtT3U0VWkwRG16TCtQK3IwZDhSQll4NS9i?=
 =?utf-8?B?d2o1eTdCYm4wcWlqTXczUU9peXRBdERZZ3Vubk1WdkprVjFPc0puNTBpTGh0?=
 =?utf-8?B?cjNRVzZaYm9NSjRoZEMvUmZHdklnYjMvY2JEeGxSL0ZNUGNuUnpnUWtUMEtF?=
 =?utf-8?B?T2dlWE5HRW1BcSt2MTJVcy9CSnM4b05wZkp5UGhiRCs2Q0s1V2xJTnRPRGdr?=
 =?utf-8?B?dUM4WWx5dmU3cm4wbHJUcXJDSzc1amQyYWt2bTR0aWs1dGpmVjZwMDY0azRa?=
 =?utf-8?B?Q2tuNHJFbVZLV21TL3k4Y09HREpaMy94eEZVWXJYS2FmMUovS1QrUVNQVXdt?=
 =?utf-8?B?bWIzKzVhelpTbHZ5VmQ3dUNKVEc1RkkvdmpPb1BPK0g0L0hLTlI2QXdrcVpP?=
 =?utf-8?B?VTJPdVJJbm84RTBvOEoraUZXQXRYSVlUNXJWOE5RNnN4enhMQmpCTjNNTElv?=
 =?utf-8?B?ODNJMEdDTW9IWHVkTjFKenFiK3lNby83bjdKZHg2aWFFNWJPc2ZsMzJDRFB1?=
 =?utf-8?B?Rjh2NDdzN0dPQm5nRVh1VVhrTk9KdjY5ZWZ6S2x1dm96Q0ptb1NYSktXNTNq?=
 =?utf-8?B?WjhqREszTXQybkZUWVA4M1RkT2pQMHRBbGs1U2MxQlNnMEMzMFE3bkU0Ty80?=
 =?utf-8?B?NWUzU21iT29xdFRKZ25XYmhtSVRTSzdHcThYWU9WeG5EZ3dmU0xMQ05kVGZn?=
 =?utf-8?B?S0F0dWVOM3U4V3haSVJxUjFVTTA3aGZRUDdYdFpPd1NEZ09XMk5LWG4rUlZl?=
 =?utf-8?B?Qm92UFAvSHM3YURSUHl0QjYvNGhYd1lYbTNrUWphcXBaUm5tQ29SVitkVTJI?=
 =?utf-8?B?TmZYemtkVVZzYno0Z2lrblIvazQyNzcrb0FCc29sbWpkelZmaVdIRnFNSStS?=
 =?utf-8?B?bTZUL3M4eTBHeE4vTXlLVkFSN3ZCNys3OEJWSHY1YTZGd0VIUVZSbDd0Qmsz?=
 =?utf-8?B?MWRHOG5wTlZnU1l5SmVLZUVLR2FHZzlFODlZbnpUUzhzbnVEaENSTVd1a2d3?=
 =?utf-8?B?RU5ocGVjWkVtczYzclErZmhJYUNrd1VIVUZXU3F3d2V4bGlpak0rZ2lpRUt5?=
 =?utf-8?B?REwyVVdxc1ZEQ09iSlNaUGdFZW5JViswUG52MUNNVUEySVVQeEp4azYzSTBH?=
 =?utf-8?B?K3FvcFN1V3F5cTdhSUhsbHk0dzl5OWZmM3E0cHB0R3V0RWJqWWFBUVV2dWVQ?=
 =?utf-8?B?Wko0dHJ5STBIZ2dKM3NpVzJjeHpVc2lQVHIvdGM1cUhUMmIrMTdld29HR3Rv?=
 =?utf-8?B?eE5ueEVqRzJpcTYrNEhiVWNvWmF1R3k3b0E0WHYzc2dxVEJwMHRXUmMzVTJK?=
 =?utf-8?B?ME53NDBhMjFvWEZGNndNRWdiZVhOeWlYNzZoa3N1M3J1Nk1nTjYzSmZlakdE?=
 =?utf-8?B?VGE2b2ZZMEFjalNjSzEvd3NZWU9RQjg1dzRYSjN2eTQ3MTI3RENTRnllZzUx?=
 =?utf-8?B?YkVaZWtkY0NtZml6U1ZIUVJEODZwMnhlYlJPeE8zcHZCS2pVcUU3YW9mbW9R?=
 =?utf-8?B?Tnc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b788cf56-9caf-4a22-83aa-08dd190af0e1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 11:08:13.9785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y99xxrjvT+AgSFCX4ySUE6J/4AkRW0vg7ARTgUl0SPNuF5hSkhOU6Lm2XbbqXPduM95wLRZgNrBBC25EW6v5IagavJuLIrcnjllWrqtJL64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10145
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Dec 2024 11:08:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5920

Hi Antonin,

On 12/10/24 11:33 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Hi Quentin,
> 
> On Fri Dec 6, 2024 at 3:23 PM CET, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 12/5/24 12:06 PM, Antonin Godard wrote:
>>> Add two scripts for building a container image and building the
>>> documentation in that image: build-docs-container and
>>> container-build-docs.
>>>
>>
>> Yet there's only one left now :) (also in your commit title).
> 
> Oops, will update in v3 :)
> 
>>> For now, the documentation/tools/dockerfiles directory contains a
>>> Dockerfile for building with Ubuntu or Debian, but we could extend this
>>> to the supported distros.
>>>
>>> It should be possible to build the full documentation with two commands:
>>>
>>>     ./documentation/tools/build-docs-container ubuntu:24.04
>>>
>>> CONTAINERCMD can be replaced by "podman" to build with podman.
>>>
>>
>> I assume installing podman-docker package could help with that too. Not
>> sure it's recommended, but I do have it installed :)
> 
> Didn't know about that one. But it shouldn't be required to use podman or docker
> independently I think?
> 

It's just that when you run `which docker` you would get podman. But we 
shouldn't require the user to install podman-docker for the script to 
work. Just wanted to mention it.

[...]

>>> +SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
>>> +CONTAINERCMD=${CONTAINERCMD:-docker}
>>> +DOCS_DIR="$SCRIPT_DIR/../.."
>>> +POKY_YAML_IN="$SCRIPT_DIR/../poky.yaml.in"
>>> +
>>> +# This lists the different images we can build and the keys we pass to yq to
>>> +# find packages in poky.yaml.in.
>>> +# The keys should be in the form of "<image>:<version>", as this will be passed
>>> +# to FROM in the selected Dockerfile below.
>>> +# These are common yq keys used for multiple distros.
>>> +_UBUNTU_DEBIAN_YQ_KEYS=".UBUNTU_DEBIAN_HOST_PACKAGES_DOC .UBUNTU_DEBIAN_HOST_PACKAGES_DOC_PDF"
>>> +declare -A YQ_KEYS=(
>>> +  [ubuntu:22.04]="$_UBUNTU_DEBIAN_YQ_KEYS"
>>> +  [ubuntu:24.04]="$_UBUNTU_DEBIAN_YQ_KEYS"
>>> +  [debian:12]="$_UBUNTU_DEBIAN_YQ_KEYS"
>>> +)
>>> +
>>> +# This lists the dockerfile to use for each of the distro listed in YQ_KEYS
>>> +# above. There should be a 1 to 1 match between the keys listed in YQ_KEYS above
>>> +# and the keys listed in DOCKERFILES below.
>>> +declare -A DOCKERFILES=(
>>> +  [ubuntu:22.04]="Dockerfile.ubuntu-debian"
>>> +  [ubuntu:24.04]="Dockerfile.ubuntu-debian"
>>> +  [debian:12]="Dockerfile.ubuntu-debian"
>>> +)
>>> +
>>> +main ()
>>> +{
>>> +  if [ "$#" -lt 1 ]; then
>>> +    echo "No image provided. Provide one of: ${!YQ_KEYS[*]}"
>>> +    exit 1
>>> +  elif [ "$1" = "list" ]; then
>>> +    echo -e "Available container images:\n\n${!YQ_KEYS[*]}"
>>> +    exit 0
>>> +  fi
>>> +
>>> +  local image="$1"
>>> +  shift
>>> +  local make_targets="${*:-publish}"
>>> +
>>> +  for cmd in $CONTAINERCMD yq; do
>>> +    if ! which "$cmd" >/dev/null 2>&1; then
>>> +      echo "The $cmd command was not found. Make sure you have $cmd installed."
>>> +      exit 1
>>> +    fi
>>> +  done
>>> +
>>> +  # Get the appropriate dockerfile from DOCKERFILES
>>> +  dockerfile="${DOCKERFILES[$image]}"
>>> +
>>> +  local temporary_dep_file="$SCRIPT_DIR/dockerfiles/deps"
>>> +  echo -n > "$temporary_dep_file" # empty the file
>>> +  for dep_key in ${YQ_KEYS[$image]}; do
>>> +    yq --raw-output --join-output "$dep_key" "$POKY_YAML_IN" >> "$temporary_dep_file"
>>> +    # add a white space after last element of yq command
>>> +    echo -n " " >> "$temporary_dep_file"
>>> +  done
>>> +
>>
>> Just use a temporary file, this would allow to run builds from two
>> different distros at the same time. mktemp should help you with that.
> 
> The problem is that the source in COPY must be part of the build context, so I
> don't having a temp file in /tmp is possible. See
> https://docs.docker.com/reference/dockerfile/#adding-files-from-the-build-context
> 
> I could use "mktemp --tmpdir=$SCRIPT_DIR/dockerfiles" but I don't really see the
> added value.
> 

"this would allow to run builds from two different distros at the same time"

Also, it's guaranteed that an old file wouldn't be used in case the 
script is somehow broken.

>>> +  # docker build doesn't accept 2 colons, so "sanitize" the name
>>> +  local sanitized_dockername
>>> +  sanitized_dockername=$(echo "$image" | tr ':.' '-')
>>> +
>>> +  $CONTAINERCMD build \
>>> +    --tag yocto-docs-$sanitized_dockername:latest \
>>> +    --build-arg ARG_FROM="$image" \
>>> +    --file "$SCRIPT_DIR/dockerfiles/$dockerfile" \
>>> +    "$SCRIPT_DIR/dockerfiles"
>>> +
>>> +  # We can remove the deps file, we no longer need it
>>> +  rm -f "$temporary_dep_file"
>>> +
>>> +  local -a args_run=(
>>> +    --rm
>>> +    --interactive
>>> +    --tty
>>> +    --volume="$DOCS_DIR:/docs:rw"
>>> +    --workdir=/docs
>>> +    --security-opt label=disable
>>> +  )
>>> +
>>> +  if [ "$CONTAINERCMD" = "docker" ]; then
>>> +    args_run+=(
>>> +      --user="$(id -u)":"$(id -g)"
>>> +    )
>>> +  elif [ "$CONTAINERCMD" = "podman" ]; then
>>> +    # we need net access to fetch bitbake terms
>>> +    args_run+=(
>>> +      --cap-add=NET_RAW
>>> +      --userns=keep-id
>>> +    )
>>> +  fi
>>> +
>>> +  $CONTAINERCMD run \
>>> +    "${args_run[@]}" \
>>> +    yocto-docs-$sanitized_dockername \
>>> +    make -C documentation $make_targets
>>> +}
>>> +
>>> +set -eu -o pipefail
>>> +
>>> +main "$@"
>>> diff --git a/documentation/tools/dockerfiles/Dockerfile.ubuntu-debian b/documentation/tools/dockerfiles/Dockerfile.ubuntu-debian
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..3c543dc4b0e96dc9c00b201558e2ed00847339fa
>>> --- /dev/null
>>> +++ b/documentation/tools/dockerfiles/Dockerfile.ubuntu-debian
>>> @@ -0,0 +1,18 @@
>>> +ARG ARG_FROM=debian:12 # default value to avoid warning
>>> +FROM $ARG_FROM
>>> +
>>> +ENV DEBIAN_FRONTEND=noninteractive
>>> +
>>> +# relative to the location of the dockerfile
>>> +COPY deps /deps
>>> +
>>> +RUN apt-get update \
>>> + && apt-get --yes --no-install-recommends install $(cat /deps) \
>>> + && apt-get --yes autoremove \
>>> + && apt-get clean \
>>> + && rm /deps
>>> +
>>> +RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen
>>> +
>>> +RUN git config --global --add safe.directory /docs
>>> +
>>>
>>
>> So... I've had another idea.
>>
>> Parsing yaml in shell, not fun.
>>
>> But I don't think we **need** the instructions to be in the YAML file.
>>
>> So I think we could drastically simplify all this by storing the setup
>> instructions in shell scripts which are included in sphinx AND use those
>> shell scripts in the Containerfile. We actually do this for our product
>> user manuals :)
>>
>> Essentially, we would have:
>>
>> $ cat documentation/host-packages-ubuntu.sh
>> sudo apt install gawk wget git diffstat unzip texinfo gcc \ [...]
>>
>> In Sphinx:
>>
>> .. literalinclude:: 50.literalinclude.apt.sh
>>      :language: bash
>>
>> In the appropriate place.
>>
>> How we generate the Containerfile internally:
>> """
>> cat <<EOF > $WORKDIR/merged.sh
>> #!/bin/bash
>> set -eux
>> export DEBIAN_FRONTEND=noninteractive
>> apt-get update
>> apt-get -y install sudo
>> EOF
>>
>> # Merge bash snippets we want to run (in the right order)
>> cat ../source/50.literalinclude.{apt,atf,uboot,linux,debos-prepare,\
>> debos-build-bookworm}.sh >> $WORKDIR/merged.sh
>>
>> chmod +x $WORKDIR/merged.sh
>>
>> podman run --rm --tmpfs=/tmp -v=$WORKDIR:$WORKDIR --security-opt
>> label=disable \  --annotation -w $WORKDIR debian:bookworm ./merged.sh
>> """
>>
>> I assume we could simply use COPY in the Containerfile and include the
>> shell script in there and run the shell script in a single RUN. You
>> could then do the cleanup step in a separate layer, not optimal since
>> the layer will be unnecessarily big but I assume the end image is going
>> to be smaller anyway?
>>
>> The benefit is that you test **exactly** what's in the documentation.
>> And also you don't have to parse YAML. And it should be relatively easy
>> to add support for new distros.
>>
>> What do you think?
> 
> I like this idea! Only downside I see is to have to re-run "apt get install" for
> each run command, which is not really ideal IMO. I prefer caching what's already

No? I have one RUN command which is "execute this shell script". 
Whatever is executed as part of this shell script is part of one layer. 
You could even have one RUN command which is apt-get update && 
my-shell-script && apt-get cache remove whatever to make this a smaller 
layer.

> been downloaded so we can re-build the doc swiftly (I imagined this script to be
> used for more than verifying that what we list in the dep list is enough to
> build, and used by anyone to test their changes to the docs easily).
> 

You can have as many scripts as you want? And have them do as many or 
little things as you want, I'm not sure to follow what you have in mind 
here?

Cheers,
Quentin

