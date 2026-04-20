Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F19BF5580B
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 10:46:37 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16838.1776681991081707350
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Apr 2026 03:46:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=LChdiat8;
 spf=pass (domain: cherry.de, ip: 40.107.130.30, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJStum01gbYhE7AVs3FziQouOwOH3YoYlYDXdhwl/QhnCL8QsJKObsCELo8vnjOL6kbqj3AUxvmwOIiySX3iYC04hyGw1jrTCYvtXj2hiKn+kfGEZT2Xwl05m1sqogfPPM8XANxN27fNNRIHFJz3l0b/MU7UJkhKTg12LOmeTgItFc5tsAiEoLAbT3xTLBNPHiqeMba0vmYUgiVM6NR0v9VCMy2HkPitJ0KMY6fnY3/ZH7CO1nGU2/YwjqodV1sOnoiK4HRGZSSf4oQF6UnwVLIcHkE8T1mPcFb8gcWvRzEASX2L98DkFiCfGJFtkSbmmjtP7zg8o/UGEltCZfKzCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/Nq+fNFaOaeCGj33Br8qtjUTzSHl/tmRDBXEolgB6U=;
 b=Y4AbO3PlcpHPSpHOdcvJprHtZ6rV7oOUpQX5BqCnkJ+wuq3sg189d8TZmNqTlfcTYl948BTZKzDNtBQk08ltyFn+FILxKaQqAVTbTBC5uzjLhy+rdIJ9J9YYDhEekZmhZlQ4hT7o6/KdOADoBNyaUG4Fw/B3Yz3SL2P/qGMMgSMWCTtNgu7xWnDGlqzjmevV7s47GpT1jAGSlrNIeADzAje7ANUnLNU5Wzg0Ki2NrDS9IGDRngiIEl/S7wBWz6S0y0SxKOW6uAxseHOixNgTweLKbsBoWohPVxV9rY1RCmq6VC6Zbzo0LbJgIT293TIKJuX/JKTV/0vkLK3KxJDNuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/Nq+fNFaOaeCGj33Br8qtjUTzSHl/tmRDBXEolgB6U=;
 b=LChdiat8MctIRjIwNp+pOLKGmwDEILGaexPOKLeTfPs5Y2UqOk/KZzh2n1aTXpCx8pQwVKR+2YKhmK1VUPd972s31NBoIkU7DMkdPgKntxtCGjx+RYLJKciMdWgkfZOsbCK5UJ18nvcVuaVhu5xx5QEzYFfQVrFH82iiDhG3Hkg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by MRWPR04MB11518.eurprd04.prod.outlook.com (2603:10a6:501:74::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 10:46:23 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%4]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 10:46:23 +0000
Message-ID: <e74cbdf2-7a0c-4d0d-aa77-c67823aa2e54@cherry.de>
Date: Mon, 20 Apr 2026 12:46:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 2/2] ref-manual/system-requirements.rst:
 instruct to install a buildtools tarball
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260420-python3-websockets-requirement-v2-0-a273a01a6f44@bootlin.com>
 <20260420-python3-websockets-requirement-v2-2-a273a01a6f44@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260420-python3-websockets-requirement-v2-2-a273a01a6f44@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIXP296CA0002.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a9::12) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|MRWPR04MB11518:EE_
X-MS-Office365-Filtering-Correlation-Id: 90de02ec-82b4-457a-20fc-08de9eca1068
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	qLOOgOU3XfpjBLsYE3HMmHcsJiNFJ1HCKBfoPhwLClyZ+lsF3UA6A/7zYMzze3F+79nsJKMQsS9kYa2nqbXqs7BGbIHe07RwcRs+9Xkri6KmbYzZAZtFhKQrTy0K3rQ1pZXzqaxD5NKaZiUkI7EusnNCAnBR69G8S5eHzo0E3yBThGuUpxbBEX65G0CGPwn0QXtMsH/JimbjFdd3PsRuL7q7JA5QwX0pB6/AqPgjbr7AEJDhcz7M4Vo4n5OKZMZUv2lUaILuimQBTgHzULsvGNU+/f6br6ESY+w6GrmN9PgtNUVnC4uaJbHoMdahBu+fkR19BO/P6lotn57+KKZQVS99Bea/XQw2Xwu0qBQcE8zpt0W1xPi4PMXrA2Ky3WaWRIZTOH2p229iwXsPmJOCkUVG6/cJ11MEdKYa/+EtCj9hpAxcDgIDs3q1orTdJNISrWPu+8TNZBzRyGLmUUcvHzfhAruUuYE8Vn0T8cximtoQZnXXFO7i9XEPVZvSOo1M/sd5tonsm3VoC/Tu1l/SukqticEzqQ2d5QCZAbN7K2sZZzenACTySzhxvw6X8ZDHZXUc8ewxAHNflXpN6fiQ854DndghQ2NyANA94wlrBEUif8ke336HvLlCNiuqH4AnAIph3bHR0B83rz8lJnytvgrbLK1yYynx5ILNT9zJS8bSf33dLTox4vV2AsugyA1ifIU0ZR5RIXe0QV3InrX+XyD1cnRBrHw60hI7QXZ8ueo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cE9ackZqbmZGN082L3N1MWxqNStVc2M1dW5kWTc0KzduaGJTdElZb3BtVHEv?=
 =?utf-8?B?TlRCYW5Ua1dWNlFWUVVWTEs2R2hLTkJneHNmdmVwRTlmNnpzRE05R2laSkRy?=
 =?utf-8?B?ZkpqaUtmekJiSVk5eXBDSVliM1BVYTVjeTV0a1duSFhJendXdG5IbldBYm1u?=
 =?utf-8?B?N0VKdVFlRWh5eUZsbWh6TFNLMHQrU0QwcTQwZkVaNGNCZmc2M2tqZUM2UTVv?=
 =?utf-8?B?UEg1U0RZZCt0NkV4Z2Q2WG9qWTBVNnovdHRXYk16bTgzdjhpd3k4WVJBbk1S?=
 =?utf-8?B?OFRyRHFCRWVNSVRpZzFkRG5waWY4WlZyVGtXbElEWE5qOGw5bUNNNWFuREFX?=
 =?utf-8?B?SFhURzFKRVRHajJ2ZlhPR1Zkd1FLMWk4R1FWR2JGWFM3L00xQ0Jka1I5MVBp?=
 =?utf-8?B?OW55ZXZrZVRPdHhnWnNJZkJJeUFXQ0JVRWRCbElZYlJyZjQ0TzVnSWRJTDRU?=
 =?utf-8?B?S29oQU91ZWtpZUlXY0RpRkV0Yk5lSS9kTForcHZ3VFVBM1FLQ1dxWHVKekg3?=
 =?utf-8?B?OThQeC9GUnNGbzkyVGswTDU3bXYyOGUyWGxFWmdnQkhFM2RoMllKQisvTjJh?=
 =?utf-8?B?Q0NqWHQ4aThhcG9udWVGckVxM0Z0Nmx2clk2aEY4R2VzdWQ2OEE4UlBTMkNw?=
 =?utf-8?B?Y2oyY1BTUDA0SXhxWXJZVzJZZCt3NGlRZ3ZTOXM1dzBRK0grVXprdG9ycitv?=
 =?utf-8?B?WkN3bmhCL3J6YTFHaDZHejRwZ3YrdGliQmNHUGQwNWFUQ1czWFpKSEZ6RXBW?=
 =?utf-8?B?bElMSDZuK1FMRE85VzF4a2Y2UUFsd3BLU3NRejZFelFBWjZ0TkZHUEoxNVdz?=
 =?utf-8?B?eDlvaTFtVjBhOG0ybUlsRlA2Q2FkTGtFNFB0Q3NndTRsOWw1ZndMajZSSHM2?=
 =?utf-8?B?QXV1eTRjdU16dDh4TW01SG1XWWdUSU5HK2NLbVkvYzE5azAwYnoyQjA4SDV4?=
 =?utf-8?B?T1E1UXNyNktrQUtzS2EveWphd3NValBOUjFPQndSbmFaRU1UVVNGR3dHSTAv?=
 =?utf-8?B?c2c0cG9nOXE4WFFzR2dRckRlM1BxbG1MMmRPanl4dVFZL3hTRmRxS0taTEsv?=
 =?utf-8?B?Q2R1ZldYV1JzbEdxY3NJV3dtYjFMQnpQSjhUcW16c3Z4aXA4RExvZ1Z1TmxO?=
 =?utf-8?B?NFVlTDdkSkpITjNHU0ZqMTBsUll4clN5RldFd3RYRld2QTVvYVF6NkpkMU5B?=
 =?utf-8?B?MUhhRGNTenc5c0lWZ1VJU2JaN3ZmWVBrWHFSWVRlWmdGa21vMUQ1WG81VElN?=
 =?utf-8?B?WXR5enZITW1Zbm5ObG5MdVVQTG5JOGJyVDZpYThYSHdSU292MTJ3aUJKcnZZ?=
 =?utf-8?B?N2Z1YlNCZVdyczhqUWpEWEk3STBjODdyWjdSdFVJWkEzcFc4Y3FOMTJDN296?=
 =?utf-8?B?QXZnMWlvcGpYWEhxQnRJRHJmZzZFUy9EOVNpbnAwM01YTkJmOFFSa0doNzh1?=
 =?utf-8?B?OWNUL1QxTy9DV3ZEaE5qalA0U0NBQ0FSUDY3VDlndm1WNVV2OWRNZHdJRldW?=
 =?utf-8?B?cGVwVXBiZmRXVy9FSFBPM1JQZGREWm02WXh5UFYvWFNxY0JsYVNYSHJJRWkr?=
 =?utf-8?B?SDZVSERsb0pLLzk4YlhqQ3NFV2pMb0JXV3pUVDhyMjhucXFsbmtjNXFmRDVK?=
 =?utf-8?B?UlhnbU9mUlRPRjhsUUZmTVAyMWRzeFpWaDBWSVgyN1ZYNlpqdnBpd2dzZ1VB?=
 =?utf-8?B?WEhHaHhSbk9nbUlXaVB2V2FrTDJ4Z0cyZy9ZMjlDTmJpSWY5UVM2OEZpV094?=
 =?utf-8?B?Y2hOUVMzTytvY1BNTjFGblkyTCttMS9OMDhxQ1Vtc3NKUWN4NjFlaXBuT1Bo?=
 =?utf-8?B?QklPK09hQm51bjY2Z0hLS3ZMNlNvVlpDK0JVajI1Tjh5c3VZeTExVjh0YWR3?=
 =?utf-8?B?SzRuK2RJNmdOejRxcGs5WDdIVkNlZDYxbzQyNGdLSW9BZ09OUW5UanY2d0pM?=
 =?utf-8?B?ak9WNTZ4Q1E4RzJzS01QUlI5L1ZiSHlac3pwb1QxUkhiZjkva0VONmRqWTYz?=
 =?utf-8?B?MVRqZjJTaVFOWGFMR1ZydjZ4YmlZWWVMUUVqTGZaSzNJMWdSREVzQnMxOXRH?=
 =?utf-8?B?bVpPcXkrSFhkWS8yT2M5elpvQ2ZUSUdHQVJsRERRT09NYVhGYTRMazBWZVN1?=
 =?utf-8?B?REVQYU54T0QvYm9kT09FcEhYVCttM045TC9obGloaWNXQThtVktSTGtOelA3?=
 =?utf-8?B?NTRZZUlkR3VOM3I5WGxoSVFPZmt3WEg3SzNzNjFlYVU2N0x3bVViUDRWaWtO?=
 =?utf-8?B?bkphekptZ3JIUTdtOXEzRHJONldZK0pvVFB5S1QvTzlHMW9QVWNCVlF3ODQy?=
 =?utf-8?B?QUlnbzhHaHVPS0ZORnRDOUhXK1VBbXlxYWJnbEFnVmNUeFIreHErS1Q5MG9U?=
 =?utf-8?Q?QPetqKzf8CIQb6nX04bFQ+KHm+dHvf9eOak6p?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 90de02ec-82b4-457a-20fc-08de9eca1068
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 10:46:22.9809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N1r8OyVQs3iGf+uSev4wPIvoO7igabbcVMwl0SZTDEZZa1kvup3RMpQqwqtHnktwoqKw1IWNzNQ9B9MaDzK/+q562UVfGKRVCBtaoXm1lPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11518
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 10:46:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9287

Hi Antonin,

On 4/20/26 11:52 AM, Antonin Godard via lists.yoctoproject.org wrote:
> I noticed that openSUSE Leap 15.6 provide Python 3.6, which is not
> supported by BitBake (which requires Python >3.9). Instruct to use a
> buildtools tarball, which is how this is done on the Autobuilder.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/system-requirements.rst | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
> index baa965573..85a26060c 100644
> --- a/documentation/ref-manual/system-requirements.rst
> +++ b/documentation/ref-manual/system-requirements.rst
> @@ -243,6 +243,11 @@ with a supported openSUSE Leap 15.6 distribution:
>   .. literalinclude:: ../tools/host_packages_scripts/opensuse_essential_15.6.sh
>      :language: shell
>   
> +Additionally, openSUSE Leap 15.6 requires a :term:`buildtools` tarball to be
> +installed and set up, as this distribution provides a version of Python that is
> +too old for :term:`BitBake`. Follow the :ref:`system-requirements-buildtools`
> +section below for more information.
> +

Shouldn't the buildtools cover all required packages to be present on 
the host? If so, do we actually need instructions without (e.g. the 
opensuse_essential_15.6.sh above)?

Cheers,
Quentin

