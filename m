Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B572C5DF87
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 14:48:12 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.378.1787237281563113636
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Aug 2026 07:48:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=K9UBXxEv;
 spf=pass (domain: cherry.de, ip: 52.101.72.56, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wyd0x6Ntgw/3d6HpMuJ5wpIA5zeYjg49I+2IMOuIRaz/3g8FTL6mmXkiq7kP/Vbvp2JTEEPE4UmMstqXr+ETCj4410HDKxR5mauhxJqPMnAGTyAn/EXYCeisM4qkifLUsfdv7q7PhenRgYu5JabOwObjq0pt+KkhNmthOOfKB2odWBlEHDDMopb5pSCaEOck4V9Ps1Aww2/kGipgYF/M+UepyD7/uWy0MOWd7xWL1RZiLkR6r4uh2nf+c/C8cAmhCGiq8vcp3AUgjjl8JwADYODgpucKdwuDZkwAS4EMHtVf3LqUeQGglby2yS1MQTpLzoD71/UkfEf+zQYUB9fPhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4XGL0aKO8F0yTQXQnDc9kJiQndilOgmsVhktfPKbDI=;
 b=yAiomAQXV1OGiNEllhB04E59VDKp2Gh2Tq9/ZI6/hJhkEr0SAgdmms7L61YD3iyi/NRzfcAPqJglTTqe0dSlptIis5qUQMNSGwRAjqj+nmlMpOo56nU3GrT4bm5CZJ062rGB4knKoqNNCtnP1v5IHiqGpe6qKr0FxeG4XEQvtvAGnp19I9HO6ZYKyVMmtnIyfv9RaOo23gOiMHDejkI+gn4DmGkrXVN2gK3+FSO2oE+cRLZLBwqI7Mce4GUSnbiNFLuqAxDnu6Cv8DEkDqvmdRdJksKPubZ3tfl/ouOlD1viMqfKUNF+FvkEx3WwcToZ5vNcejjH9M+Jf4CB1of3Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4XGL0aKO8F0yTQXQnDc9kJiQndilOgmsVhktfPKbDI=;
 b=K9UBXxEvctugOFYyansGuUq3kX6VGa3T0me5+4FN88CisQYFAOrfAJM5YwsSSzbEVaYAxi4eeeukWofWlFKAupUS8TfRB86ySfgiabCNYXVgNqnpZ2zCU8+KVPKIhwVgqC9O68eR8JoZ8OLbcuFVX31iPLpJWU6KksjzkbeD4n0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by MIYPR04MB12576.eurprd04.prod.outlook.com (2603:10a6:290:79::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 14:47:57 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%4]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 14:47:56 +0000
Message-ID: <1b02e8ba-0946-40b0-a8e7-a381fd8cb81e@cherry.de>
Date: Thu, 20 Aug 2026 16:47:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] commands to do "pip install" in docs README file need
 enhancing
To: tgamblin@baylibre.com, "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <959e65b6-e7eb-bcc3-992f-bed7276c8449@crashcourse.ca>
 <DKTSXW5WZTQW.383TF2WMPIE77@baylibre.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DKTSXW5WZTQW.383TF2WMPIE77@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR04CA0091.eurprd04.prod.outlook.com
 (2603:10a6:803:64::26) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|MIYPR04MB12576:EE_
X-MS-Office365-Filtering-Correlation-Id: 785d3038-a54f-4a8f-ab35-08defeca05be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|10070799003|1800799024|23010399003|366016|56012099006|5023799004|11063799006|10067099003|3023799007|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	jNGowowvnSUskbrRXrwMURXlJQSwfPnL+cX+buF2wuoKj0FZaA8ac0iJNQLY7zRJIdjAcsUQ3RFFdsB89mviRuoidMYHQq8htyOMUiz7tClHzwHVNJCgE903C2b4YfECcfO1bJg9SdFidIC8XGW1Lp1/SMabxUGbv8I6veuhfPNx/EYMogw/pet8Ebdo76cbyUh3Yo8CFk6SEqefOqDyHOEjLAhqQVJ+WBjQE1IjTKaAuVAfxQuImfWaTggaxDjxtHBpZeH5vH1XU28z4fejfFyMolEme/wN/tJokNgb6Dnq9Bpaf7E4fOKEoSSPNhZAAvX8mfHTfppVCl74uS4oZW5WqRMnz7YuYGK5aES9aE7Gdx0z8kDCzuwMcgLOad0zqDNkGC/yJ8oF1frv8X75ddQCgNORwBsSMfstnDQkDaxfMlIW+hOqwVHxYCB9W7MeDDfa+4NSNb9R65LhNK4kdfRinGuGLxK2UXiaQpFjh1F6sZ8jgVMTZcEvYOqV9gGmHcTqq9+M4B4DsvoARbDDZ8OCOZDYrIV9JQjNwzqBJZFR5+TCmlv5JbFl7dEAhn8gQ48aSIbiHE0ybdpiuAVnVV5PGSS/Fsk5C5Ptvl/+nNh29OcOdJP6I9Qig1oCh97c1Ojny8rKDE8Jw7RMWIFL0K8++U9ATBp/ZAtWHe5tcZM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(23010399003)(366016)(56012099006)(5023799004)(11063799006)(10067099003)(3023799007)(4143699003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hZrKzroGZZpN+yvf9AVVT4+0XXKum7mEM5RSaHn3BBtRVeTArB3Kd1K+ouXj?=
 =?us-ascii?Q?HxfE1YzxwA39r0cdy/SuCEBIu0gbcM3gwnocDe8fh+IxEQE9+edYEGqSRcJa?=
 =?us-ascii?Q?/G7FyTcHU3GwpB+lIu9ekwij2lu3QeQhWz+Y38y9sDOALIFHlQBlDKx5qI/6?=
 =?us-ascii?Q?BhQtggzGlYxMzkZHELTRuNl4fJl4mGdwmloF9LSshArQlw83Kpj7iW1gJIDj?=
 =?us-ascii?Q?wYC1JH9SOS/5lCqJ+A3CuT/n5SJVMDwsZLaUgLDBMbZXWUNNIZhd8MgnSayz?=
 =?us-ascii?Q?7R+bkdElS5ZUtJNtUh3FdE+b1MXCjHtzmLcMzQzWv9CgoTv9C0zUmOH1MDxu?=
 =?us-ascii?Q?cRXELDx9F+P7VHBDz55uNf1WdpI24893oRcTNnDzNGrOpE66oapEg13nMBK6?=
 =?us-ascii?Q?Xl8aqkIiBFAOmmDfIFeqcy0gEbsroVGMlWEqBjy/IZqsGOlF19iyRRVZfUuK?=
 =?us-ascii?Q?zU9E1bSWt9NsYSHcyHHiDTR79r8VNmGLtVX4EuAGFrChpg+2P2lrYRW+6VQO?=
 =?us-ascii?Q?0Pd9mNx0zyK6P53syxPnrvDHk0KHuObIddK/BY6uEEJKVHRN15yvxi0+M+qR?=
 =?us-ascii?Q?D+E0wKgU5q4QVJ+Q6mADwkqoMF3ZJG+8IeUfdd7GImza4+6QdGpydX37jDAy?=
 =?us-ascii?Q?+CzEVM5QInIkVEkMU59JGPRQsjGmBftq4VCNCQnzq/TNtsNYkyfqFoelQF4t?=
 =?us-ascii?Q?rC15xf2TrXISJYxTuetARwwuAAx1eoqhmTfaJV+zCWzvBjttREi/qfamncOb?=
 =?us-ascii?Q?XgPY+aTsUbV7FBK4gp3mAXSbyc+5ZeQfnHktDTMBV7tENqALDxlI6o3ki/Hz?=
 =?us-ascii?Q?fu14ToRBETx1sJ/bzujI27CGj0vtV3VFGgJxuc4/e8KjhupixZwn7i4QyOp2?=
 =?us-ascii?Q?uTPtBnqBnznp3yMhdMk2YBCU8bvHXmsOGKFuml3/7CjnqWoZvIZSX3SGHcLE?=
 =?us-ascii?Q?E7cwTfAPmmVfqfZ7MHdPJIkWVroGB3XOivPZZOfqER3CALnxbk60yLgxd74V?=
 =?us-ascii?Q?G5EMwsGnd5WUxKhNy9LkPTHqE9kEn7vUwvalvdjXa//FVLChBlzDntBqEW8l?=
 =?us-ascii?Q?M6g5v91O93d4dhlG76C74tf7GtGACayDRijR+2pI/13plMgO+/L/PQ3P0CQ9?=
 =?us-ascii?Q?wbFVjO+tGc69yS3lpLKS0J5I/Q3Eo5Skxm4wuiXto7x20VBzKSKYDVB/ocO0?=
 =?us-ascii?Q?o/H16/WBP/yjOdTUb7H3zTvaJ+nMiBKRMeRrmtM9xvYa8wT9LnLLdZUflpo8?=
 =?us-ascii?Q?f3tmlFpcJSdF4wNGsQKhUD16XIzJ4l4/AK3742jrrUJSL+jMUqIltzxjoJIZ?=
 =?us-ascii?Q?vRECp86lJ0/WIwwU/694SqzQM3QpPppbGHyyUPCxuGsgxBSiBD+PdKhLmGZX?=
 =?us-ascii?Q?R1Dc0ytYKtY2NCww9LYvYPqY0Fk3fkOciAim5UMt3TygtGSYp132XOXDsMXJ?=
 =?us-ascii?Q?hJn/SObbDhheUnXDFqygLnnqmzJoqDFOjCtYF1C6Uka3/aSjm2u2MesDDePP?=
 =?us-ascii?Q?qMFcfiUn/UJFHb7J3zNnxSKl79LdNGFo04+HppJ9a+rzzkQ87v1Z0/uwBxag?=
 =?us-ascii?Q?XpAqKU734VbemktBHwOPnKWDA2ftrZ50UgIJ08OeanyCQcaTpEcIQP4yriKy?=
 =?us-ascii?Q?IrwCnvmbWrbKKvETiS9G+1iKA+78h/9dIoQXQ49DkkxuGYqreP+vJ/aF6uvv?=
 =?us-ascii?Q?0ntgIC+MVfYk6Q6MQFQVsIDwG4ZaUojZmMadI/4fG4CsDtf3a5BoJUV87Dkj?=
 =?us-ascii?Q?UBeky8uktUDPWTNU6qUfPzI52OGH9c06o0U4OIJuQ/yELGnjtmkZTnv4HJkz?=
X-MS-Exchange-AntiSpam-MessageData-1: C1s/PiJc/AlKbA==
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 785d3038-a54f-4a8f-ab35-08defeca05be
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 14:47:56.7522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iV56pQQ5eSIpImN2ZGWyJysRlKBCGvUEvrl9hNnqRiVPNZBqAenA0U0irCY2cleeVT90DMJQQMoLNbedqx1DpmquJa+HHR9Avdmr8FIV9po=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIYPR04MB12576
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Aug 2026 14:48:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10303

On 8/20/26 3:23 PM, Trevor Gamblin via lists.yoctoproject.org wrote:
> On Thu Aug 20, 2026 at 7:20 AM EDT, Robert P. J. Day wrote:
>>
>>    I just went through this with another Sphinx-based documentation
>> repo -- installation instructions that advise the reader to install
>> Python modules with "pip install" fail on my Debian 13 system with:
>>
>>
>> $ pip install sphinx-lint
>> error: externally-managed-environment
>>
>> =C3=97 This environment is externally managed
>> =E2=95=B0=E2=94=80> To install Python packages system-wide, try apt inst=
all
>>      python3-xyz, where xyz is the package you are trying to
>>      install.
>>
>>      If you wish to install a non-Debian-packaged Python package,
>>      create a virtual environment using python3 -m venv path/to/venv.
>>      Then use path/to/venv/bin/python and path/to/venv/bin/pip. Make
>>      sure you have python3-full installed.
>>
>>      If you wish to install a non-Debian packaged Python application,
>>      it may be easiest to use pipx install xyz, which will manage a
>>      virtual environment for you. Make sure you have pipx installed.
>>
>>      See /usr/share/doc/python3.13/README.venv for more information.
>>
>> note: If you believe this is a mistake, please contact your Python
>> installation or OS distribution provider. You can override this, at
>> the risk of breaking your Python installation or OS, by passing
>> --break-system-packages.
>> hint: See PEP 668 for the detailed specification.
>>
>>
>>    Yes, there are solutions, such as using "pipx" instead of "pip", and
>> what have you, but it seems that the README file should be augmented
>> with an explanation as to how to deal with the above given that the
>> "pip install" commands are, in some cases, guaranteed to fail.
>=20
> Creating a venv like the error suggests (or via uv) is simple enough and =
IMO
> best practice for anything like this. You could submit a change to provid=
e short
> examples, even replacing the references to pipenv earlier in the file.
>>

It's not that simple (though not that difficult). A venv by default is=20
completely isolated and doesn't use anything from the host. The issue is=20
that by doing so, you won't be able to build the docs, only run=20
sphinx-lint, which isn't ideal. You should probably reuse the same venv=20
as documented in documentation/tools/host_packages_scripts/pip3_docs.sh=20
instead.

You probably want to update the instructions for Vale as well. We still=20
support pipenv though, via documentation/Pipfile as far as I remember,=20
so that's another option. Maybe add something in dev-packages for=20
example. No clue, I don't use pipenv.

Cheers,
Quentin

