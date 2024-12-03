Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC1CBE64A82
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 11:38:03 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.80])
 by mx.groups.io with SMTP id smtpd.web11.17201.1733225878741136311
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Dec 2024 03:37:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ns5DIefx;
 spf=pass (domain: cherry.de, ip: 40.107.103.80, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z3NMGntJ8u1II3m+tvPrmQeRkZChZ9ULCglMCLe7OGXEpXFXeTF6SLI4Dbx0gc2LUCs7eWnKlE3NSPVjlH2mV3aiFAsKzJ6kyHGysP3oG3tp01kUvDka21G0uu+ISeK8+5Q0LrkM8QJhUKB27kFvuId+TZBDjs81Kz7FkgO51E7aowxIRXNWRmrYE8vIJRP6ujg4zB1tTE9lZ5nvKJKMtx5x4ztSz2c6PjWWjWxSfsAj5HDyZ7rlfcTGpxrDe7i2NGPsvtG1miibK9V7rhW+DTRob384jrU5SV0r8SoMIu91990CfmdsPBF6h/O08DeGpOh6pbr9dYMu3Z0wkbU1Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qdNq3JjPba+ETcGWuPuvsFJFNPb53w8A3jdtJ3m3Tg=;
 b=a9WEkeQOHeDZ8jSWve33fJr4jYhO1yXA2unmRpbLpWFU9JY0CFalHKUWD1Yl3pCQVtU0wvE1xlsAUXAHQ6iAC618749R7wnXd/LyWqeS1Zbs740X/JLAC8sJYijeObK+9cpGiQpqIJD99mcCecYuf8SvdAApz4NT8NWbc1XtkvMKp0HjiLmhWCxpKDVnn1oK4H9oeC4KbtpROlCgNYXEukN8DSVWrEQWP4V3GXr/Zw1ioDjSEOrbutO8bZ/6rxD2I4FbN+UGqIaVzf3s7EzVt+o9QV0qysxUyIc3e+7N9i8Nv+HGVMSVV7PDIV5BNKJ0hhCfPB+GhGwAZNjvkXQ9qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qdNq3JjPba+ETcGWuPuvsFJFNPb53w8A3jdtJ3m3Tg=;
 b=ns5DIefxdqatqNdOENz8zr02cr0vOBnTEX2MyZX0WWsl4+FkPGGpHhE293RQe5RCXrU7+3b4JsbES0k/Z8Z2QQH6QXA1HTlqf6v0Ql+D0UtEk97Hh6jCyDCiCWzeJ1kgWE8xgzChgslwVKJp8N/QJKcp6idEsFAIdHdn/YGQ578=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU4PR04MB10936.eurprd04.prod.outlook.com (2603:10a6:10:588::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 11:37:54 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 11:37:54 +0000
Message-ID: <43178380-7636-4d2e-b964-a77a3759eae4@cherry.de>
Date: Tue, 3 Dec 2024 12:37:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH] Add scripts to build the docs in
 containers
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241121-docs-build-dockerfiles-v1-1-3b54e1237bf5@bootlin.com>
 <3b8d482f-93c4-4ad8-ad74-6ed8365fcede@cherry.de>
 <D5YR4057DRW4.36YJYWAR7MRDB@bootlin.com>
 <D6208NWRJAPX.SPZ8IMGUAUZ@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D6208NWRJAPX.SPZ8IMGUAUZ@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU4PR04MB10936:EE_
X-MS-Office365-Filtering-Correlation-Id: 75970841-50b8-4472-167c-08dd138eec68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aCtQSTJWMi9lcGNVK0tGaDVBL2JKYklwYjFtNGtPRHQ3Um9ISmZNUy9qZGxx?=
 =?utf-8?B?R1RaODZVNGJCQUdkUkhuZmVrNVMzMExaRWlXK1lmVk9FSVFCVUl5OEJHeVli?=
 =?utf-8?B?VkdwZUVKU29YL3dsTXdBZ1ZrV0xxMWxmQmtxY3RZWldIeTlUbzB0Y1kxaWt2?=
 =?utf-8?B?RVZST1ZGZ20weHlQanJUcDd6WVVMRWJ5V0Q4QWsvYndGMlJsQ3p6NkQ2bnc4?=
 =?utf-8?B?UWs4WWhVTXFMeXVLZXRxNStHWEtabjVxRHAwakdBdnZNZy9yVEpMZVRUVDFv?=
 =?utf-8?B?MUhZWFBFald3N3F4QlowNEdWWkJzNHVlN09sdGJaOVBGc3ZJdTQvMVpYN1hN?=
 =?utf-8?B?UysvcllGYTByTFN1alplaUlsUEdOT0ZOUm1ZS0FyUS9KQjdwc1VqMVcybHJD?=
 =?utf-8?B?OVZWNUN1ejhFd0ZTWkJEdTFnOVBYUnpxRHNnZHZkVk5LLzhrNGxVUnp3WXoz?=
 =?utf-8?B?RzFlVXN6V3gxdHo2S2hOWGQ0V3hDcnFDOFpCZkNONHMzTjVrWVFGSVBOSm9S?=
 =?utf-8?B?SHp5Tlk1K3pJZk5qZ0QvU1cvNGVJeDh1YXlkMHNkc3ZGd2xFejkyeWdtS3pY?=
 =?utf-8?B?bndrV0FlbkxTNVdOOWVzd0drZlBjaC9Lam9NYUNEbTd3TXV3WWdqZndmNGZP?=
 =?utf-8?B?cHUvTEI2ODQ4RUpYMUxJTk53ZkZZVUxUeWs0Zkl5UUd4dllJRmdmdWJuRk5P?=
 =?utf-8?B?T1RDbG9tZFdQMWNFMlhRWEg2bXljM014SnBjRFlKaFdzV1lWRmxqd2U5dnhz?=
 =?utf-8?B?bEZ6TVFJQnUyQ29rWVIrSHVoNTRscDFteTUydWtIU3FRb3g1OXBsSXdGWFZB?=
 =?utf-8?B?MVF1ZWQ1amM5dHRtUCtCVHgzMXh1UXBiajMwTU5hZG1ETmF6KzBaaGZhOWNu?=
 =?utf-8?B?RHhyOG5yYlZPeGFiRkMvajFGL2pqTHZxb05YRWJRQkZvV1JiRk03QkdjbExD?=
 =?utf-8?B?eWJVaG5WdjJFV290N0FQek1wTTVtTnoyK0dQWm4yM1FqcS8rZjNZLzZUdU1Q?=
 =?utf-8?B?c0dlTGwwU1RnZ1VtSHBGYndFWDJHNGtmTnNWVGtjeUlrbThUQ1QwSXhqdzhm?=
 =?utf-8?B?TWdueUxIZS9BWmMrcWx5Y0wya3FRWFRNQWFITEJzUkZxRDlHakxldWpqcU9p?=
 =?utf-8?B?UGpRc2dOMWo3WHVFNC9YaHJGN010My9YeUhHTUhUK2UxeDNjOXhDb21nSGx3?=
 =?utf-8?B?WmRwOFhwT3A4UytSY0h6ZTdTN09neWtUdDJxL3pHUkdoNGR3UC9RK09tOW9q?=
 =?utf-8?B?MDVhWG13NmpmOFE5SURVaFBFUDAranJxZUN4cVE5TVR3U0o4ZlUxTXoyVWRC?=
 =?utf-8?B?dk0yRndwZVczYVlrOWVab1NoK1lHR29CYWJSRmJPeWdMWFduYkNkeTVML25r?=
 =?utf-8?B?ZjR4cUlpTThoTFp2cmQ4SkthbkVpRHAwK1dqelBEZldqU2FNS1lRWjRjdXpY?=
 =?utf-8?B?NG4wY204bEhXbUlFbkltVmJack92U2Z6VE5HU1V2ZE5nK0ZoTlcrRFdPYXlL?=
 =?utf-8?B?Z3MwUWZuYzFScmJpV1pEbkswV0xqU2pSNFFoWUlYUjJtVmdMTzN0MjIrV2Zt?=
 =?utf-8?B?VkJhRjM4dWNtclRKZnVNbXJBcWIxZHZicUlXRG1CcmJuV25rSXdwNmtyL2ZN?=
 =?utf-8?B?NEpDTXJYd2NKMlZSWDlUQ1JZWUVGVzFqVkRub2IzaXFUcjZVU29YTkIxRktE?=
 =?utf-8?B?MkhQSkZ0ZDV6Z2NOcUM0OTV6SDc1WlZKL3RERUhMRzRRaWZ0UnpzUlJkUy9T?=
 =?utf-8?B?d2ZTRXdHQTBNUSt5ZUdUUWlpUkRVbTVFQzFQRnJmUU9Da0JDU0Ivb3Mvbk13?=
 =?utf-8?B?V3p3Qk9hOHZza25vby8rUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bVFGTXZTT01NN3kyRjFLRWJTWm9mLytyTzNsQ3VKeU5ib0ZEaC81TkFETUNo?=
 =?utf-8?B?ZlVjZkQ4eTlrQ3ExM3N6MktHRlNMKzdRWmsxRVpTNjc3Q0Y5YktsZWN3b0lz?=
 =?utf-8?B?VHNGR0ZFVEpGb1BhU29pWVB0UHVqUlZISDNVbmJ3T3lxRFZJb0M1YWVSTnhD?=
 =?utf-8?B?UVFENnRVM0x4VWdQcWRRd1o2bkNLb2U2c0NJM3dlZ3ZwdHZ5cCtCUS9wZHRF?=
 =?utf-8?B?a3U3NFI4ODhZTzJsR3duTSt3YXlEN2tsMjRYbGJYNlVHMGxLSnJiTkIzYkNn?=
 =?utf-8?B?Z1dobFAvcCtqTHQyNTQwbEtOM1Z4bDM3ZHNLN1ovR2x4U1prUm9JV0xqVVlj?=
 =?utf-8?B?R2Yxd1pBTmI2ZjAyeWJKSGFWRU1RRDEwSHdTbjFxeWYyUUthbFFER05IaUp3?=
 =?utf-8?B?REtYcEpmdnFiNDZDWnhjVlZKa2syOHVNNW5Tc2xnRDJ0SStwR01ZZURxTFRi?=
 =?utf-8?B?UFZBR2FtTWtSMC9LelNramYzQ2liamh0bU1pckV1Ri9qZzRSdlZINS9ZNjc2?=
 =?utf-8?B?cExxSDJ2VXB3VlRlTHVJcVVycUhSQ3hnN1JHMW5pZktXNDdwUlRrRWdzdGJ0?=
 =?utf-8?B?czB1dExmMU9ZWStZa2ZCWE1YTmROY1ZpcU0vRzRtQmpld1BYaHdGUzVwcGcr?=
 =?utf-8?B?ZHF3SEI2dVRwZ2pvM2tUemRSbGRBb29vZnJtaEhFWG8wUklEOXpnMlV1YTNr?=
 =?utf-8?B?KytaQ0RiaHhoN2FIOThPUlpkYXdxWldZZnZlN3k4ZUM4cFl1ckViaXBpNFR0?=
 =?utf-8?B?SXpISzJPcWVCclFRMUxxVkJNbEZvVGdlUWpiNHBWeFlqQ1V0M2FXVHN1VGYz?=
 =?utf-8?B?cWhHZFd1VVVUWG5hWG1zdnIwMXFHRUxrb2Z0K1JkSUMvalVFcER6N0RtNk9S?=
 =?utf-8?B?ZmlpN2NmcmVoSUFqY1R1R0NqUDRSYm5sYksvTWF5MVhXZXZKdkJJU0Jqc2pr?=
 =?utf-8?B?Ujd1WmRRdkIvby8wTGc2UU5IU3RiWGU1a2c1dEpGMldFY1o5TVBHa3k5QnF0?=
 =?utf-8?B?bUx4dVljZzFpUGNTc3BrMG55Y3JpUEE2UW9aQm55V2R6NkpyWE9CemcxNi9D?=
 =?utf-8?B?a3BhRGRsN3dzeFVndXkxR21DTUJGTGpvekR4V2wzZzhxMGRQYVQ4RjUzcDFR?=
 =?utf-8?B?K1gwejlqNXRkdHlwREJOYmIxRmVVdkc3RHIzLzJvWXZtV2NYYnpEb0hJTVBG?=
 =?utf-8?B?RHgxUFhmc2gvc1plQXFhN29XNlFLdHdadFJ2NzF5M0pxQ3h2Znl1ZE42T3N6?=
 =?utf-8?B?SU1PeXNFeThZb1ppc0Zaek5NL2lkSjQ3RXBnS1Vsekw4NnVUVk9oaSszZGtT?=
 =?utf-8?B?SEVQTWhXaE9ZMjhqaUVSaXFHcVFwOVU1cEQ5WUIwd0dGcWowOHBoYUh1QkJ6?=
 =?utf-8?B?cGEvYTMzU3V4OXpLbjhzdzJ0S29SNFhnYVdZc1VIU1VVWUpyTVJuN1o0cHBR?=
 =?utf-8?B?L1pvcGJUZ256ZFora09WRk1yTGRpTHlZL2tzYnFxZisxWUVJektCNHdvVzF1?=
 =?utf-8?B?MWRQTVhWcmg4dTdROWVVTWhLUERzNXlKaEkrNkJsQ3VDeHFIRlFxOHZ3RU1B?=
 =?utf-8?B?TXcwa2w5SXRNUnVwSEJhaUVtcnl3b3FkQzhsZnVmUFh4TTZSN0tLNXdOZEhL?=
 =?utf-8?B?aGhKRmpHbVRURklBVjcyVU8zcDVnMlFjWDc5ZzVGWUNMYnNCdjNUOTd5aCtm?=
 =?utf-8?B?a05iRXptNUsxRFlrMGZYVVdPV3JnRnRLYnJIck9lYmRWbmw1N3RkaXRKeHZ2?=
 =?utf-8?B?NHBYWERpbXpTOEpSSWlSWTFtVkUrbUFKZHVFOXEzRXF3cTMwYVcvZDZhTEJt?=
 =?utf-8?B?T2hQUnpESGJHSkpZUkw0VGdGemR4MEM2SElVUm1IUytGOGhsV3JRMERBYjk2?=
 =?utf-8?B?V29WYU1CN1p3bi96eGxRWjZPL0hPTXZGZS9EYkxlVzBTcTVRUFdZcVh5cVF4?=
 =?utf-8?B?VzRGVjFITklnQVRIeld0dWZEWW1GWEhJeGJFalJsdzdQVHA0WmU4L1JsbUtv?=
 =?utf-8?B?ZEpCRWc1ZkQ0Rlc1ZVBSUlBCcUUvYTVSZUhPVWl4ZGpSUkY5N05NMjdQL1N1?=
 =?utf-8?B?aHZQRHVnSk93dWxidEk4ZENTZGtBaEttdjlqK3ZENnZ4MHphaFNQdHhUck1B?=
 =?utf-8?B?d2RoUWRxY3B6RzRtSVJmWXdaUjV3QTYrSTArR1NXcnp5K2M3aThuaGQ2ZzBr?=
 =?utf-8?B?aXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 75970841-50b8-4472-167c-08dd138eec68
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 11:37:54.1633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wiByU7Y6e4NcUKWd0e1lfXOU+HzmRCFDKkhAjvaZWVzKS8IJXu5JHt6/Q2B1tzAKEUjjqCaGj9/h5y2bPi/I/a7CsQtu6mtB4a10BttCy/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10936
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 03 Dec 2024 11:38:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5867

Hi Antonin,

On 12/3/24 11:48 AM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Fri Nov 29, 2024 at 4:01 PM CET, Antonin Godard wrote:
> [...]
>>>> +  fi
>>>> +
>>>> +  $CONTAINERCMD run \
>>>> +    --rm --interactive --tty \
>>>> +    --volume "$DOCS_DIR:/docs:rw" \
>>>> +    --workdir "/docs" \
>>>> +    $EXTRA_ARGS_RUN \
>>>> +    "yocto-docs-$image" \
>>>
>>> please prepend the image name with localhost/ to be sure we don't end up
>>> downloading some yocto-docs-ubuntu from docker.io for example :)
>>
>> Nice tip, didn't know about that one, thanks :)
> 
> Hm, this doesn't seem to work for me, and I couldn't find anything on the net
> that shows this. Is there something I'm missing?
> 
>    Unable to find image 'localhost/yocto-docs-ubuntu-24-04:latest' locally
>    docker: Error response from daemon: Get "http://localhost/v2/": dial tcp [::1]:80: connect: connection refused.
> 
> 
> Building an image named "localhost/..." will work, but I think it's just
> building an image with the name "localhost/...". Not really building something
> local.
> 

$ cat Containerfile
FROM debian:bookworm-slim
$ podman build -f Containerfile -t test-image:latest
[...]
$ podman image ls | grep test-image:latest
localhost/test-image 
latest                b2ac1dc43440  14 months ago  156 MB
$ podman run -it --userns=keep-id localhost/test-image
qschulz@e706c5542422:/$
$ cat Containerfile.from
FROM localhost/test-image
$ podman build -f Containerfile.from -t another-image:latest
[...]
$ podman run -it --userns=keep-id localhost/another-image
qschulz@4e1f3229a196:/$

On Fedora 41.

Could possibly be yet another difference with Docker?

I couldn't find a way to force fully qualified names from the CLI (one 
can do that with podman on fedora by removing 
unqualified-search-registries in /etc/containers/registries.conf I 
believe). I guess maybe --block-registry '*' would work, but still not 
sure this is something supported by Docker either, /me shrugs.

Cheers,
Quentin

