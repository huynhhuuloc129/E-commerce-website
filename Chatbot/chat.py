import torch
import os
os.environ["HF_HOME"] = "D:/huggingface_cache"
os.environ["TRANSFORMERS_CACHE"] = "D:/huggingface_cache/transformers"
os.environ["TORCH_HOME"] = "D:/huggingface_cache/torch"
os.environ['HF_HUB_DISABLE_SYMLINKS_WARNING'] = '1'  # Disable symlink warnings
os.environ['PYTORCH_CUDA_ALLOC_CONF'] = 'max_split_size_mb:128'

from transformers import AutoModelForCausalLM, AutoTokenizer
tokenizer = AutoTokenizer.from_pretrained("chatdb/natural-sql-7b")
model = AutoModelForCausalLM.from_pretrained(
    "chatdb/natural-sql-7b",
        device_map="auto",
    torch_dtype=torch.float16
)

model = model.half()
database_schema = """
Dữ liệu của tôi bao gồm các bảng sau:
1. projects: id (int), name (varchar), popularity (int)
2. users: id (int), name (varchar), email (varchar)
3. tasks: id (int), project_id (int), assigned_to (int), status (varchar)
"""

# Combine the schema with the question
prompt = database_schema + "\n" + "Tạo một câu lệnh SQL để trả lời câu hỏi sau: Dự án nào phổ biến nhất?"
inputs = tokenizer(prompt, return_tensors="pt").to("cuda")

generated_ids = model.generate(
    **inputs,
    num_return_sequences=1,
    eos_token_id=100001,
    pad_token_id=100001,
    max_new_tokens=200,
    do_sample=False,
    num_beams=1,
)

outputs = tokenizer.batch_decode(generated_ids, skip_special_tokens=True)
print(outputs[0].split("```sql")[-1])
